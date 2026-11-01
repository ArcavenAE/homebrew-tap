#!/usr/bin/env bash
# Pull-request self-test for scripts/tap-sync.sh. Needs gh and jq, and edits
# Formula/*.rb in the working tree (restored on exit by the test itself).
# Usage: scripts/tap-selftest.sh
set -euo pipefail
export LC_ALL=C
cd "$(dirname "$0")/.."
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

# Hostile or malformed tags are refused before they reach a Ruby string.
for bad in 'a"b' 'x#{system("id")}' 'a b' 'a$(id)' "a'b" '' 'a/b'; do
  if scripts/tap-sync.sh --name-ok "$bad"; then echo "tag [$bad] was accepted"; exit 1; fi
done
scripts/tap-sync.sh --name-ok alpha-20261101-021300-a60052f
scripts/tap-sync.sh --name-ok v0.1.0-rc.1
echo "name check ok"

# Checksum refusals, offline: a gh stub serves a fake release, so the checks run
# against known bytes. A good release rewrites the formula; a release digest that
# differs from the downloaded asset, or a checksums.txt that differs from the
# release digest, must fail and leave the formula alone. Then two mutants of
# tap-sync.sh, one per check, must each be caught by the same cases.
cat > "$tmp/gh-stub" <<'STUB'
#!/usr/bin/env bash
set -eu
tag=alpha-20260102-000000-bbbbbbb
case "$1 $2" in
  "api repos/example/fake/releases?per_page=30") echo "$tag" ;;
  "api repos/example/fake/releases/tags/$tag")
    case "$*" in
      *.digest*) printf 'fake.tar.gz\t%s\n' "$FAKE_DIGEST" ;;
      *) printf 'fake.tar.gz\nchecksums.txt\n' ;;
    esac ;;
  "release download")
    pat="" dir="" out=""
    while [[ $# -gt 0 ]]; do
      case "$1" in -p) pat="$2"; shift ;; -D) dir="$2"; shift ;; -O) out="$2"; shift ;; esac
      shift
    done
    if [[ "$pat" == checksums.txt ]]; then
      printf '%s  fake.tar.gz\n' "$FAKE_SUM" > "${out:-$dir/checksums.txt}"
    else
      printf 'payload\n' > "$dir/$pat"
    fi ;;
  *) echo "gh stub: unexpected call: $*" >&2; exit 99 ;;
esac
STUB
chmod +x "$tmp/gh-stub"
good_sum="$(printf 'payload\n' | shasum -a 256 | cut -d' ' -f1)"
wrong_sum="$(head -c 64 /dev/zero | tr '\0' 1)"
fx_case() { # fx_case SCRIPT DIGEST SUM -> rc, and the changed list in fx/list.txt
  rm -rf "$tmp/fx"; mkdir -p "$tmp/fx/scripts" "$tmp/fx/Formula" "$tmp/fx/bin"
  cp "$1" "$tmp/fx/scripts/tap-sync.sh"; chmod +x "$tmp/fx/scripts/tap-sync.sh"
  printf 'fake\texample/fake\t^alpha-\tkeep\n' > "$tmp/fx/scripts/tap-sync.tsv"
  printf '%s\n' 'class Fake < Formula' '  version "1"' \
    '  url "https://github.com/example/fake/releases/download/alpha-20260101-000000-aaaaaaa/fake.tar.gz"' \
    "  sha256 \"$(head -c 64 /dev/zero | tr '\0' 0)\"" 'end' > "$tmp/fx/Formula/fake.rb"
  cp "$tmp/fx/Formula/fake.rb" "$tmp/fx/fake.before"
  cp "$tmp/gh-stub" "$tmp/fx/bin/gh"
  rc=0
  (cd "$tmp/fx" && PATH="$tmp/fx/bin:$PATH" FAKE_DIGEST="$2" FAKE_SUM="$3" scripts/tap-sync.sh list.txt > out.txt 2>&1) || rc=$?
}
# fx_verdict SCRIPT: 0 when the good release is taken and both bad ones refused.
fx_verdict() {
  local ok=0
  fx_case "$1" "$good_sum" "$good_sum"
  if [[ "$rc" -ne 0 ]] || ! grep -qx Formula/fake.rb "$tmp/fx/list.txt" || ! grep -q "$good_sum" "$tmp/fx/Formula/fake.rb"; then
    echo "  good release was not taken (rc=$rc)"; ok=1
  fi
  fx_case "$1" "$wrong_sum" "$wrong_sum"
  if [[ "$rc" -eq 0 ]] || [[ -s "$tmp/fx/list.txt" ]] || ! cmp -s "$tmp/fx/Formula/fake.rb" "$tmp/fx/fake.before"; then
    echo "  a release digest that differs from the asset was accepted (rc=$rc)"; ok=1
  fi
  fx_case "$1" "$good_sum" "$wrong_sum"
  if [[ "$rc" -eq 0 ]] || [[ -s "$tmp/fx/list.txt" ]] || ! cmp -s "$tmp/fx/Formula/fake.rb" "$tmp/fx/fake.before"; then
    echo "  a checksums.txt that differs from the release digest was accepted (rc=$rc)"; ok=1
  fi
  return "$ok"
}
fx_verdict scripts/tap-sync.sh
echo "checksum refusals ok"
mutant() { # mutant NAME SED-EXPR: the verdict must go red on the damaged script
  sed -e "$2" scripts/tap-sync.sh > "$tmp/mut-$1.sh"
  if cmp -s scripts/tap-sync.sh "$tmp/mut-$1.sh"; then echo "mutant $1 did not change the script"; exit 1; fi
  if fx_verdict "$tmp/mut-$1.sh" > /dev/null; then echo "mutant $1 stayed green"; exit 1; fi
  echo "mutant $1 goes red"
}
mutant skip-asset-digest 's/"\$got" != "\$want"/"1" = "2"/'
mutant skip-checksums 's/"\$want" != "\$sum"/"1" = "2"/'

# Make a formula look stale (an older alpha tag, zeroed sha256, wrong version),
# run the renderer, and require the file to come back byte for byte.
# A release landing mid-run fails this; re-run it.
stale_roundtrip() {
  local formula="$1" repo="$2" f cur old zeros
  f="Formula/$formula.rb"
  cur="$(sed -n 's#.*/releases/download/\([^/]*\)/.*#\1#p' "$f" | head -n 1)"
  old="$(gh api "repos/$repo/releases?per_page=30" --jq '.[].tag_name' | { grep '^alpha-' || true; } | sort | head -n 1)"
  [[ -n "$old" && "$old" != "$cur" ]]
  cp "$f" "$tmp/$formula.orig"
  zeros="$(head -c 64 /dev/zero | tr '\0' 0)"
  sed -i.bak -e "s#/download/$cur/#/download/$old/#" -e "s#sha256 \"[0-9a-f]*\"#sha256 \"$zeros\"#" -e 's#^  version ".*"#  version "stale"#' "$f"
  rm -f "$f.bak"
  ! cmp -s "$f" "$tmp/$formula.orig"
  scripts/tap-sync.sh "$tmp/$formula.txt"
  grep -qx "$f" "$tmp/$formula.txt"
  cmp "$f" "$tmp/$formula.orig"
  echo "$formula: stale formula restored ($old -> $cur)"
}
stale_roundtrip marvel ArcavenAE/marvel      # version mode dotted, publishes checksums.txt and an attestation
stale_roundtrip stave ArcavenAE/stave        # version mode tag

# A formula already newer than the newest matching release is left alone.
f=Formula/stave.rb
cur="$(sed -n 's#.*/releases/download/\([^/]*\)/.*#\1#p' "$f" | head -n 1)"
cp "$f" "$tmp/stave.pre"
sed -i.bak "s#/download/$cur/#/download/alpha-99999999-999999-ffffff/#" "$f"; rm -f "$f.bak"
cp "$f" "$tmp/stave.future"
scripts/tap-sync.sh "$tmp/future.txt"
cmp "$f" "$tmp/stave.future"
! grep -qx "$f" "$tmp/future.txt"
cp "$tmp/stave.pre" "$f"
echo "older-tag guard ok"
