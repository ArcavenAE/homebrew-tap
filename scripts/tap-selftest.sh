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

# Semver rows (sidestep rc and stable), offline. A gh stub serves forty alpha
# tags first and then the rest, so a reader that stops at the newest thirty misses
# an rc or stable release, and a reader that sorts by name picks v0.1.9 over
# v0.1.10. The rows under test are the real ones from scripts/tap-sync.tsv.
cat > "$tmp/gh-sv" <<'STUB'
#!/usr/bin/env bash
set -eu
printf '%s\n' "$*" >> "$FAKE_LOG"
if [[ "$1 $2" == "release download" ]]; then
  dir="" pat=""
  while [[ $# -gt 0 ]]; do
    case "$1" in -p) pat="$2"; shift ;; -D) dir="$2"; shift ;; esac
    shift
  done
  printf 'payload\n' > "$dir/$pat"
  exit 0
fi
alphas="$(i=0; while [[ $i -lt 40 ]]; do printf 'alpha-2026%04d-000000-aaaaaaa\n' "$((i + 1))"; i=$((i + 1)); done)"
all="$(printf '%s\n%s\n' "$alphas" "$FAKE_TAGS")"
case "$*" in
  "api --paginate repos/"*"/releases?per_page=100 "*) printf '%s\n' "$all" ;;
  "api repos/"*"/releases?per_page=30 "*) printf '%s\n' "$all" | head -n 30 ;;
  "api repos/"*"/releases/tags/"*)
    case "$*" in
      *.digest*) printf 'fake.tar.gz\t%s\n' "$FAKE_DIGEST" ;;
      *) printf 'fake.tar.gz\n' ;;
    esac ;;
  *) echo "gh stub: unexpected call: $*" >&2; exit 99 ;;
esac
STUB
chmod +x "$tmp/gh-sv"
sv_pay="$(printf 'payload\n' | shasum -a 256 | cut -d' ' -f1)"
sv_zero="$(head -c 64 /dev/zero | tr '\0' 0)"
sv_row() { # sv_row NAME [REGEX [MODE]]: the real row, with a field replaced for a mutant
  awk -F'\t' -v OFS='\t' -v n="$1" -v re="${2-}" -v mode="${3-}" '$1 == n { if (re != "") $3 = re; if (mode != "") $4 = mode; print }' scripts/tap-sync.tsv
}
sv_case() { # sv_case SCRIPT ROW FORMULA CURTAG CURVERSION TAGS -> rc; sv/ holds the result
  rm -rf "$tmp/sv"; mkdir -p "$tmp/sv/scripts" "$tmp/sv/Formula" "$tmp/sv/bin"
  cp "$1" "$tmp/sv/scripts/tap-sync.sh"; chmod +x "$tmp/sv/scripts/tap-sync.sh"
  printf '%s\n' "$2" > "$tmp/sv/scripts/tap-sync.tsv"
  printf '%s\n' 'class Fake < Formula' "  version \"$5\"" \
    "  url \"https://github.com/example/fake/releases/download/$4/fake.tar.gz\"" \
    "  sha256 \"$sv_zero\"" 'end' > "$tmp/sv/Formula/$3.rb"
  cp "$tmp/sv/Formula/$3.rb" "$tmp/sv/before.rb"
  cp "$tmp/gh-sv" "$tmp/sv/bin/gh"
  : > "$tmp/sv/gh.log"
  rc=0
  (cd "$tmp/sv" && PATH="$tmp/sv/bin:$PATH" FAKE_TAGS="$6" FAKE_DIGEST="$sv_pay" FAKE_LOG="$tmp/sv/gh.log" \
    scripts/tap-sync.sh list.txt > out.txt 2>&1) || rc=$?
}
sv_took() { # sv_took FORMULA TAG VERSION: the formula now names TAG and VERSION
  grep -q "/download/$2/fake.tar.gz" "$tmp/sv/Formula/$1.rb" && grep -qx "  version \"$3\"" "$tmp/sv/Formula/$1.rb" && grep -q "$sv_pay" "$tmp/sv/Formula/$1.rb"
}
sv_untouched() { cmp -s "$tmp/sv/Formula/$1.rb" "$tmp/sv/before.rb" && [[ ! -s "$tmp/sv/list.txt" ]]; }
# sv_verdict SCRIPT [STABLE-REGEX [STABLE-MODE [RC-REGEX]]]: 0 when every case holds.
sv_verdict() {
  local ok=0 stable rc_row alpha_cur="alpha-20261027-020151-35eab35"
  stable="$(sv_row sidestep "${2-}" "${3-}")"; rc_row="$(sv_row sidestep-rc "${4-}")"
  [[ -n "$stable" && -n "$rc_row" ]] || { echo "  a sidestep row is missing from tap-sync.tsv"; return 1; }
  # 1. Stable picks v0.1.10 over v0.1.9, from beyond the newest thirty, never an rc.
  sv_case "$1" "$stable" sidestep "$alpha_cur" "$alpha_cur" $'v0.1.0-rc.1\nv0.1.9\nv0.1.10\nv0.1.0-rc.10'
  if [[ "$rc" -ne 0 ]] || ! sv_took sidestep v0.1.10 0.1.10; then echo "  stable did not take v0.1.10 (rc=$rc)"; ok=1; fi
  grep -q 'per_page=100' "$tmp/sv/gh.log" || { echo "  stable did not page the release list"; ok=1; }
  # 2. Only alpha and rc tags on offer: the stable formula is left alone, with a notice.
  sv_case "$1" "$stable" sidestep "$alpha_cur" "$alpha_cur" $'v0.1.0-rc.1\nv0.1.0-rc.2'
  if [[ "$rc" -ne 0 ]] || ! sv_untouched sidestep || ! grep -q '::notice::' "$tmp/sv/out.txt"; then echo "  an alpha or rc tag reached the stable row (rc=$rc)"; ok=1; fi
  # 3. The rc row picks rc.10 over rc.9, past the newest thirty, and ignores stable tags.
  sv_case "$1" "$rc_row" sidestep-rc v0.1.0-rc.1 0.1.0-rc.1 $'v0.1.0\nv0.1.0-rc.9\nv0.1.0-rc.10\nv0.1.0-rc.2'
  if [[ "$rc" -ne 0 ]] || ! sv_took sidestep-rc v0.1.0-rc.10 0.1.0-rc.10; then echo "  rc did not take rc.10 (rc=$rc)"; ok=1; fi
  # 4. Only alpha and stable tags on offer: the rc formula is left alone.
  sv_case "$1" "$rc_row" sidestep-rc v0.1.0-rc.1 0.1.0-rc.1 $'v0.1.0\nv0.2.0'
  if [[ "$rc" -ne 0 ]] || ! sv_untouched sidestep-rc; then echo "  a stable tag reached the rc row (rc=$rc)"; ok=1; fi
  # 5. A formula already at v0.1.10 is not taken back to v0.1.9.
  sv_case "$1" "$stable" sidestep v0.1.10 0.1.10 'v0.1.9'
  if [[ "$rc" -ne 0 ]] || ! sv_untouched sidestep || ! grep -q 'left alone' "$tmp/sv/out.txt"; then echo "  the older-tag guard compared by name (rc=$rc)"; ok=1; fi
  # 6. A formula at v0.1.9 does move to v0.1.10.
  sv_case "$1" "$stable" sidestep v0.1.9 0.1.9 'v0.1.10'
  if [[ "$rc" -ne 0 ]] || ! sv_took sidestep v0.1.10 0.1.10; then echo "  v0.1.9 was not moved to v0.1.10 (rc=$rc)"; ok=1; fi
  # 7. A row without the flags still fails loudly when nothing matches, and reads thirty.
  sv_case "$1" $'fake\texample/fake\t^zzz-\tkeep' fake "$alpha_cur" 1 ''
  if [[ "$rc" -eq 0 ]] || ! grep -q '::error::fake: no release' "$tmp/sv/out.txt" || ! grep -q 'per_page=30' "$tmp/sv/gh.log" || grep -q 'per_page=100' "$tmp/sv/gh.log"; then
    echo "  a row without the flags changed behavior (rc=$rc)"; ok=1
  fi
  return "$ok"
}
sv_verdict scripts/tap-sync.sh
echo "semver rows ok"
sv_mutant() { # sv_mutant NAME SED-EXPR: the damaged script must go red
  sed -e "$2" scripts/tap-sync.sh > "$tmp/svm-$1.sh"
  if cmp -s scripts/tap-sync.sh "$tmp/svm-$1.sh"; then echo "mutant $1 did not change the script"; exit 1; fi
  if sv_verdict "$tmp/svm-$1.sh" > /dev/null; then echo "mutant $1 stayed green"; exit 1; fi
  echo "mutant $1 goes red"
}
sv_mutant sort-by-name 's/| vsort_tags | tail/| sort | tail/'
sv_mutant guard-by-name 's/\[\[ "\$(vkey "\$tag")" < "\$(vkey "\$cur")" \]\]/[[ "$tag" < "$cur" ]]/'
sv_mutant newest-thirty 's/gh api --paginate "repos\/\$repo\/releases?per_page=100"/gh api "repos\/$repo\/releases?per_page=30"/'
sv_mutant optional-ignored 's/\*,optional,\*/*,never,*/'
sv_mutant optional-for-all 's/\[\[ ",\${flags:-}," == \*,optional,\* \]\]/true/'
sv_mutant no-strip-v 's/strip-v) ver="\${tag#v}"/strip-v) ver="$tag"/'
row_mutant() { # row_mutant NAME STABLE-REGEX STABLE-MODE RC-REGEX: a damaged row must go red
  if sv_verdict scripts/tap-sync.sh "$2" "$3" "$4" > /dev/null; then echo "mutant $1 stayed green"; exit 1; fi
  echo "mutant $1 goes red"
}
row_mutant stable-row-takes-any-tag '^' '' ''
row_mutant stable-row-unanchored-end '^v[0-9]+\.[0-9]+\.[0-9]+' '' ''
row_mutant stable-row-keeps-v '' tag ''
row_mutant rc-row-takes-any-tag '' '' '^'
row_mutant rc-row-drops-rc-suffix '' '' '^v[0-9]+\.[0-9]+\.[0-9]+$'

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
