#!/usr/bin/env bash
# Rewrite tracked formulas in place from each project's newest release.
# Usage: scripts/tap-sync.sh [changed-list-file]   (default: changed.txt)
# Needs gh and jq. It edits Formula/*.rb and writes the changed paths to the
# list file. It never commits; scripts/tap-commit.sh does that.
set -euo pipefail
export LC_ALL=C

# A tag or asset name ends up inside Ruby strings in the formula, and a git ref
# may hold a double quote or #{...}. Accept only a plain charset, and fail closed.
safe_name() { [[ ${#1} -ge 1 && ${#1} -le 128 && "$1" =~ ^[A-Za-z0-9._-]+$ ]]; }
if [[ "${1:-}" == "--name-ok" ]]; then safe_name "${2-}"; exit; fi

cd "$(dirname "$0")/.."

list="${1:-changed.txt}"
: > "$list"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
fail=0

# Version order for a row that sets the semver flag. Every run of digits in a tag
# is zero-padded to ten places, so a plain string compare of two keys orders
# v0.1.10 above v0.1.9 and rc.10 above rc.9. Rows without the flag keep the
# plain string order they always had.
vkey() { printf '%s\n' "$1" | awk '{ out = ""; s = $0
  while (match(s, /[0-9]+/)) { out = out substr(s, 1, RSTART - 1) sprintf("%010d", substr(s, RSTART, RLENGTH) + 0); s = substr(s, RSTART + RLENGTH) }
  print out s }'; }
vsort_tags() { while IFS= read -r t; do if [[ -n "$t" ]]; then printf '%s\t%s\n' "$(vkey "$t")" "$t"; fi; done | sort | cut -f2-; }

while IFS=$'\t' read -r formula repo re mode flags; do
  case "$formula" in ''|'#'*) continue ;; esac
  f="Formula/$formula.rb"
  if [[ ! -f "$f" ]]; then echo "::error::$f is listed but missing"; fail=1; continue; fi

  # The tag embeds the build time, and a release's created_at can be out of
  # order with it (two marvel alphas minutes apart), so pick the newest tag by name.
  # A row with the semver flag reads every page of releases (the releases
  # endpoint has no tag filter, and a channel's last release can be older than
  # thirty newer ones) and orders by version. Other rows read the newest thirty
  # and order by name, as before.
  if [[ ",${flags:-}," == *,semver,* ]]; then
    tag="$(gh api --paginate "repos/$repo/releases?per_page=100" --jq '.[] | select(.draft == false) | .tag_name' \
      | { grep -E "$re" || true; } | vsort_tags | tail -n 1)"
  else
    tag="$(gh api "repos/$repo/releases?per_page=30" --jq '.[] | select(.draft == false) | .tag_name' \
      | { grep -E "$re" || true; } | sort | tail -n 1)"
  fi
  if [[ -z "$tag" ]]; then
    if [[ ",${flags:-}," == *,optional,* ]]; then echo "::notice::$formula: no release of $repo matches $re yet; left alone"; continue; fi
    echo "::error::$formula: no release of $repo matches $re"; fail=1; continue
  fi

  if ! safe_name "$tag"; then echo "::error::$formula: newest matching tag of $repo has characters outside A-Za-z0-9._-; refusing it"; fail=1; continue; fi

  cur="$(sed -n 's#.*/releases/download/\([^/]*\)/.*#\1#p' "$f" | head -n 1)"
  if [[ -z "$cur" ]]; then echo "::error::$f has no release url to rewrite"; fail=1; continue; fi
  if ! safe_name "$cur"; then echo "::error::$f carries a release tag with characters outside A-Za-z0-9._-"; fail=1; continue; fi
  if [[ "$tag" == "$cur" ]]; then echo "$formula: current at $cur"; continue; fi
  if [[ ",${flags:-}," == *,semver,* ]]; then older=0; [[ "$(vkey "$tag")" < "$(vkey "$cur")" ]] && older=1
  else older=0; [[ "$tag" < "$cur" ]] && older=1; fi
  if [[ "$older" -eq 1 ]]; then echo "::notice::$formula: formula tag $cur is newer than the newest matching release $tag; left alone"; continue; fi

  case "$mode" in
    tag) ver="$tag" ;;
    strip-v) ver="${tag#v}" ;;
    dotted) ver="0.1.0-$(printf '%s' "$tag" | tr '-' '.')" ;;
    keep) ver="" ;;
    *) echo "::error::$formula: unknown version mode $mode"; fail=1; continue ;;
  esac

  # sha256 per asset from the release API; where the release also publishes
  # checksums.txt, every shared name must agree with it.
  gh api "repos/$repo/releases/tags/$tag" \
    --jq '.assets[] | select(.digest != null) | "\(.name)\t\(.digest | sub("^sha256:"; ""))"' > "$tmp/digests.tsv"
  names="$(gh api "repos/$repo/releases/tags/$tag" --jq '.assets[].name')"
  if grep -qx 'checksums.txt' <<< "$names"; then
    gh release download "$tag" -R "$repo" -p checksums.txt -O "$tmp/checksums.txt"
    bad=0
    while read -r sum name; do
      want="$(awk -F'\t' -v n="$name" '$1 == n { print $2 }' "$tmp/digests.tsv")"
      if [[ -n "$want" && "$want" != "$sum" ]]; then echo "::error::$formula: $name differs between checksums.txt and the release digest"; bad=1; fi
    done < "$tmp/checksums.txt"
    if [[ "$bad" -ne 0 ]]; then fail=1; continue; fi
  fi

  # Integrity before rendering: download each asset the formula names, require
  # its sha256 to match the release digest, and where the release publishes an
  # attestation bundle, verify the asset against it.
  mkdir -p "$tmp/dl"
  rm -f "$tmp/dl"/*
  have_att=""
  if grep -qx 'attestations.sigstore.json' <<< "$names"; then
    gh release download "$tag" -R "$repo" -p attestations.sigstore.json -D "$tmp/dl"
    have_att=yes
  fi
  bad=0
  for name in $(sed -n 's#.*/releases/download/[^/]*/\([^"]*\)".*#\1#p' "$f"); do
    if ! safe_name "$name"; then echo "::error::$formula: asset name in $f is outside A-Za-z0-9._-"; bad=1; continue; fi
    gh release download "$tag" -R "$repo" -p "$name" -D "$tmp/dl" --clobber
    got="$(shasum -a 256 "$tmp/dl/$name" | cut -d' ' -f1)"
    want="$(awk -F'\t' -v n="$name" '$1 == n { print $2 }' "$tmp/digests.tsv")"
    if [[ "$got" != "$want" ]]; then echo "::error::$formula: $name sha256 $got differs from the release digest $want"; bad=1; continue; fi
    if [[ -n "$have_att" ]] && ! gh attestation verify "$tmp/dl/$name" -R "$repo" --bundle "$tmp/dl/attestations.sigstore.json" > /dev/null; then
      echo "::error::$formula: attestation verify failed for $name"; bad=1
    fi
  done
  if [[ "$bad" -ne 0 ]]; then fail=1; continue; fi

  if ! awk -v old="$cur" -v new="$tag" -v ver="$ver" -v dig="$tmp/digests.tsv" '
    BEGIN { while ((getline l < dig) > 0) { split(l, a, "\t"); d[a[1]] = a[2] } }
    ver != "" && /^[[:space:]]*version "/ { sub(/version "[^"]*"/, "version \"" ver "\"") }
    {
      key = "/download/" old "/"
      i = index($0, key)
      if ($0 ~ /url "/ && i > 0) {
        rest = substr($0, i + length(key)); sub(/".*$/, "", rest); asset = rest
        if (!(asset in d) || d[asset] !~ /^[0-9a-f]{64}$/) { print "no sha256 for asset " asset > "/dev/stderr"; bad = 1 }
        $0 = substr($0, 1, i - 1) "/download/" new "/" substr($0, i + length(key))
        pend = asset
      } else if ($0 ~ /sha256 "/ && pend != "") {
        sub(/sha256 "[^"]*"/, "sha256 \"" d[pend] "\""); pend = ""
      }
      print
    }
    END { exit bad }' "$f" > "$tmp/out.rb"; then
    echo "::error::$formula: could not rewrite $f for $tag"; fail=1; continue
  fi
  if ! ruby -c "$tmp/out.rb" > /dev/null; then echo "::error::$formula: rewritten formula is not valid ruby"; fail=1; continue; fi
  if ! cmp -s "$f" "$tmp/out.rb"; then
    cp "$tmp/out.rb" "$f"
    echo "$f" >> "$list"
    echo "$formula: $cur -> $tag"
  fi
done < scripts/tap-sync.tsv

exit "$fail"
