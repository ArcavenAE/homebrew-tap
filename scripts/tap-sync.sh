#!/usr/bin/env bash
# Rewrite tracked formulas in place from each project's newest release.
# Usage: scripts/tap-sync.sh [changed-list-file]   (default: changed.txt)
# Needs gh and jq. It edits Formula/*.rb and writes the changed paths to the
# list file. It never commits; scripts/tap-commit.sh does that.
set -euo pipefail
export LC_ALL=C
cd "$(dirname "$0")/.."

list="${1:-changed.txt}"
: > "$list"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
fail=0

while IFS=$'\t' read -r formula repo re mode; do
  case "$formula" in ''|'#'*) continue ;; esac
  f="Formula/$formula.rb"
  if [[ ! -f "$f" ]]; then echo "::error::$f is listed but missing"; fail=1; continue; fi

  # The tag embeds the build time, and a release's created_at can be out of
  # order with it (two marvel alphas minutes apart), so pick the newest tag by name.
  tag="$(gh api "repos/$repo/releases?per_page=30" --jq '.[] | select(.draft == false) | .tag_name' \
    | { grep -E "$re" || true; } | sort | tail -n 1)"
  if [[ -z "$tag" ]]; then echo "::error::$formula: no release of $repo matches $re"; fail=1; continue; fi

  cur="$(sed -n 's#.*/releases/download/\([^/]*\)/.*#\1#p' "$f" | head -n 1)"
  if [[ -z "$cur" ]]; then echo "::error::$f has no release url to rewrite"; fail=1; continue; fi
  if [[ "$tag" == "$cur" ]]; then echo "$formula: current at $cur"; continue; fi
  if [[ "$tag" < "$cur" ]]; then echo "::notice::$formula: formula tag $cur is newer than the newest matching release $tag; left alone"; continue; fi

  case "$mode" in
    tag) ver="$tag" ;;
    dotted) ver="0.1.0-$(printf '%s' "$tag" | tr '-' '.')" ;;
    keep) ver="" ;;
    *) echo "::error::$formula: unknown version mode $mode"; fail=1; continue ;;
  esac

  # sha256 per asset from the release API; where the release also publishes
  # checksums.txt, every shared name must agree with it.
  gh api "repos/$repo/releases/tags/$tag" \
    --jq '.assets[] | select(.digest != null) | "\(.name)\t\(.digest | sub("^sha256:"; ""))"' > "$tmp/digests.tsv"
  if gh api "repos/$repo/releases/tags/$tag" --jq '.assets[].name' | grep -qx 'checksums.txt'; then
    gh release download "$tag" -R "$repo" -p checksums.txt -O "$tmp/checksums.txt"
    bad=0
    while read -r sum name; do
      want="$(awk -F'\t' -v n="$name" '$1 == n { print $2 }' "$tmp/digests.tsv")"
      if [[ -n "$want" && "$want" != "$sum" ]]; then echo "::error::$formula: $name differs between checksums.txt and the release digest"; bad=1; fi
    done < "$tmp/checksums.txt"
    if [[ "$bad" -ne 0 ]]; then fail=1; continue; fi
  fi

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
