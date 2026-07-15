#!/usr/bin/env bash
#
# .claude/skills/release/release.sh <version> [--dry-run] [--yes]
#
# Mechanical half of the `/release` skill. Deterministic, no judgment: the
# skill (Claude) decides the version number and writes the changelog entries
# under `## [Unreleased]` FIRST, then hands off to this script to stamp,
# commit, land on master, tag, and publish the GitHub Release.
#
# What it does, in order:
#   1. Validate: semver arg, clean tree (apart from the skill's CHANGELOG.md
#      edit), on release/next & up to date with origin, gh authenticated, tag
#      not already used, [Unreleased] non-empty.
#   2. Stamp CHANGELOG.md: rename `## [Unreleased]` to `## [<version>] - <date>`
#      and insert a fresh empty `## [Unreleased]` above it.
#   3. Bump the `## Version <x>` comment at the top of compose/compose.yaml.
#   4. Commit the two files to release/next as "chore: prep <version> release".
#   5. Push release/next, fast-forward master to it, push master.
#   6. Create + push tag <version>, then `gh release create` using the newly
#      stamped changelog section as the release notes.
#
# Flags:
#   --dry-run   Stamp the files, show the diff, then revert and exit. No commit,
#               no push, no tag, no release.
#   --yes       Skip the interactive "proceed to push/tag/publish?" prompt.
#               The skill passes this after you approve in chat.
#
# Notes:
#   - Must be run by a repo admin: master is protected (PRs required for
#     non-admins) but enforce_admins is off, so an admin can fast-forward
#     master directly. A non-admin push will be rejected.
#   - Tags are bare semver (e.g. 54.0.0), no `v` prefix, matching history.
#   - Bash 3.2 compatible (default macOS bash).

set -euo pipefail

usage() {
  sed -n '2,40p' "$0" | sed 's/^# \{0,1\}//'
}

VERSION=""
DRY_RUN=0
ASSUME_YES=0

while [ $# -gt 0 ]; do
  case "$1" in
    --dry-run) DRY_RUN=1; shift ;;
    --yes|-y)  ASSUME_YES=1; shift ;;
    -h|--help) usage; exit 0 ;;
    -*)        echo "Unknown flag: $1" >&2; exit 2 ;;
    *)
      if [ -z "$VERSION" ]; then VERSION="$1"; else
        echo "Unexpected argument: $1" >&2; exit 2
      fi
      shift ;;
  esac
done

RED='\033[0;31m'; YELLOW='\033[0;33m'; GREEN='\033[0;32m'; NC='\033[0m'
die()  { printf "${RED}release: %s${NC}\n" "$1" >&2; exit 1; }
note() { printf "${GREEN}release: %s${NC}\n" "$1"; }
warn() { printf "${YELLOW}release: %s${NC}\n" "$1" >&2; }

# --- Locate repo root (skill lives at .claude/skills/release/) -------------
REPO_ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
cd "$REPO_ROOT"

CHANGELOG="CHANGELOG.md"
COMPOSE="compose/compose.yaml"
RELEASE_BRANCH="release/next"
MAIN_BRANCH="master"

# --- Validate input ---------------------------------------------------------
[ -n "$VERSION" ] || { usage; exit 2; }
case "$VERSION" in
  v*) die "version must be bare semver without a 'v' prefix (got '$VERSION')." ;;
esac
printf '%s' "$VERSION" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$' \
  || die "invalid version '$VERSION'. Expected X.Y.Z (e.g. 54.0.0)."

[ -f "$CHANGELOG" ] || die "$CHANGELOG not found — run from repo root."
[ -f "$COMPOSE" ]   || die "$COMPOSE not found."

# --- Preconditions ----------------------------------------------------------
command -v gh >/dev/null 2>&1 || die "gh CLI is required (brew install gh)."
gh auth status >/dev/null 2>&1 || die "gh is not authenticated (gh auth login)."

CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
[ "$CURRENT_BRANCH" = "$RELEASE_BRANCH" ] \
  || die "must be on '$RELEASE_BRANCH' (currently on '$CURRENT_BRANCH')."

# The skill (Step 3) writes the [Unreleased] entries into CHANGELOG.md before
# calling this script, so an uncommitted CHANGELOG.md is the expected state — it
# gets stamped below and folded into the single "chore: prep" commit. Any OTHER
# dirty path is a real problem and aborts.
DIRTY="$(git status --porcelain | awk '$0 !~ /[ \/]CHANGELOG\.md$/')"
[ -z "$DIRTY" ] \
  || die "working tree has uncommitted changes other than CHANGELOG.md. Commit or stash first."

git fetch --quiet origin "$RELEASE_BRANCH" "$MAIN_BRANCH" --tags
[ "$(git rev-parse HEAD)" = "$(git rev-parse "origin/$RELEASE_BRANCH")" ] \
  || die "local $RELEASE_BRANCH is not in sync with origin/$RELEASE_BRANCH."

if git rev-parse -q --verify "refs/tags/$VERSION" >/dev/null \
   || git ls-remote --exit-code --tags origin "$VERSION" >/dev/null 2>&1; then
  die "tag '$VERSION' already exists."
fi

# master must be a strict ancestor of release/next so a fast-forward is valid.
git merge-base --is-ancestor "origin/$MAIN_BRANCH" HEAD \
  || die "origin/$MAIN_BRANCH is not an ancestor of $RELEASE_BRANCH — cannot fast-forward. Reconcile manually."

if [ "$(git rev-parse HEAD)" = "$(git rev-parse "origin/$MAIN_BRANCH")" ]; then
  die "nothing to release — $RELEASE_BRANCH has no commits beyond $MAIN_BRANCH."
fi

# --- Guard: [Unreleased] must contain at least one bullet -------------------
UNRELEASED_BODY="$(awk '
  /^## \[Unreleased\]$/ { cap=1; next }
  cap && /^## \[/       { cap=0 }
  cap                   { print }
' "$CHANGELOG")"
printf '%s\n' "$UNRELEASED_BODY" | grep -Eq '^- ' \
  || die "the [Unreleased] section has no entries. The skill must write the changelog before calling this script."

RELEASE_DATE="$(date +%F)"

# --- Stamp CHANGELOG.md -----------------------------------------------------
# Replace the first `## [Unreleased]` line with a fresh empty Unreleased
# heading followed by the new version heading. Entries below stay put and
# end up under the new version.
awk -v ver="$VERSION" -v d="$RELEASE_DATE" '
  !done && /^## \[Unreleased\]$/ {
    print "## [Unreleased]"
    print ""
    print "## [" ver "] - " d
    done=1
    next
  }
  { print }
' "$CHANGELOG" > "$CHANGELOG.tmp" && mv "$CHANGELOG.tmp" "$CHANGELOG"

# --- Bump compose.yaml version comment --------------------------------------
sed -i.bak -E "s/^(## Version ).*/\1${VERSION}/" "$COMPOSE" && rm -f "$COMPOSE.bak"
grep -q "^## Version ${VERSION}$" "$COMPOSE" \
  || die "failed to bump '## Version' line in $COMPOSE — is the comment present?"

# --- Extract the just-stamped section for release notes ---------------------
NOTES_FILE="$(mktemp)"
trap 'rm -f "$NOTES_FILE"' EXIT
awk -v ver="$VERSION" '
  $0 ~ "^## \\[" ver "\\] - " { cap=1; next }
  cap && /^## \[/             { cap=0 }
  cap                         { print }
' "$CHANGELOG" | sed -e '/./,$!d' | awk 'NF{blank=0} !NF{blank++} blank<2 || NF' > "$NOTES_FILE"

echo
note "Prepared release $VERSION (dated $RELEASE_DATE). File changes:"
git --no-pager diff -- "$CHANGELOG" "$COMPOSE"
echo
note "Release notes that will be posted to GitHub:"
echo "----------------------------------------------------------------------"
cat "$NOTES_FILE"
echo "----------------------------------------------------------------------"

# --- Dry run stops here -----------------------------------------------------
if [ "$DRY_RUN" -eq 1 ]; then
  git checkout -- "$CHANGELOG" "$COMPOSE"
  warn "--dry-run: reverted file changes, nothing committed or pushed."
  exit 0
fi

# --- Confirm before anything irreversible -----------------------------------
if [ "$ASSUME_YES" -ne 1 ]; then
  printf "Proceed to commit, push %s + %s, tag %s, and publish the GitHub Release? [y/N] " \
    "$RELEASE_BRANCH" "$MAIN_BRANCH" "$VERSION"
  read -r reply
  case "$reply" in
    y|Y|yes|YES) : ;;
    *) git checkout -- "$CHANGELOG" "$COMPOSE"; die "aborted by user; file changes reverted." ;;
  esac
fi

# --- Commit, land on master, tag, publish -----------------------------------
git add "$CHANGELOG" "$COMPOSE"
git commit -q -m "chore: prep ${VERSION} release" -m "" \
  -m "Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>"
git push --quiet origin "$RELEASE_BRANCH"
note "Committed and pushed prep to $RELEASE_BRANCH."

git checkout --quiet "$MAIN_BRANCH"
git merge --quiet --ff-only "$RELEASE_BRANCH"
git push --quiet origin "$MAIN_BRANCH"
note "Fast-forwarded $MAIN_BRANCH to $RELEASE_BRANCH and pushed."

git tag "$VERSION"
git push --quiet origin "$VERSION"
note "Tagged $VERSION."

gh release create "$VERSION" --title "$VERSION" --target "$MAIN_BRANCH" --notes-file "$NOTES_FILE"

git checkout --quiet "$RELEASE_BRANCH"
note "Done. Back on $RELEASE_BRANCH."
gh release view "$VERSION" --json url -q .url
