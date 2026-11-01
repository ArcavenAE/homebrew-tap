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
