#!/usr/bin/env bash
# Commit the files named in a list as one commit to a branch, through the
# GraphQL createCommitOnBranch mutation with the job's own GITHUB_TOKEN, then
# fail unless GitHub reports the commit as verified.
# Usage: scripts/tap-commit.sh <list-file> <branch>
# Env: GH_TOKEN, GITHUB_REPOSITORY. Run from a checkout of the branch head.
set -euo pipefail
list="${1:?list file}"
branch="${2:?branch}"
repo="${GITHUB_REPOSITORY:?}"

[[ -s "$list" ]] || { echo "nothing to commit"; exit 0; }

adds='[]'
count=0
while IFS= read -r path; do
  [[ -n "$path" ]] || continue
  adds="$(jq --arg p "$path" --arg c "$(base64 < "$path" | tr -d '\n')" '. + [{path: $p, contents: $c}]' <<< "$adds")"
  count=$((count + 1))
done < "$list"

# The checkout's head, not the branch's current head: a push that landed since
# the checkout makes the call fail instead of being overwritten.
head="$(git rev-parse HEAD)"
req="$(mktemp)"
jq -n --arg repo "$repo" --arg branch "$branch" --arg oid "$head" --argjson adds "$adds" \
  --arg headline "chore(formula): sync $count formula(s) from their releases" '
  { query: "mutation($input: CreateCommitOnBranchInput!) { createCommitOnBranch(input: $input) { commit { oid } } }",
    variables: { input: {
      branch: { repositoryNameWithOwner: $repo, branchName: $branch },
      expectedHeadOid: $oid,
      message: { headline: $headline },
      fileChanges: { additions: $adds } } } }' > "$req"

sha="$(gh api graphql --input "$req" --jq '.data.createCommitOnBranch.commit.oid')"
[[ -n "$sha" ]] || { echo "::error::createCommitOnBranch returned no commit"; exit 1; }
echo "committed $sha"

verification="$(gh api "repos/$repo/commits/$sha" --jq '.commit.verification')"
echo "$verification" | jq '{verified, reason}'
if [[ "$(jq -r '.verified' <<< "$verification")" != "true" ]]; then
  echo "::error::commit $sha is not verified; failing"
  exit 1
fi
