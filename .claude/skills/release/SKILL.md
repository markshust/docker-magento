---
name: release
description: Cut a new docker-magento release end to end — analyze merged PRs since the last release, decide the next version, auto-generate CHANGELOG entries in the project's format, bump the compose.yaml version, land on master, tag, and publish the GitHub Release. Use when the user types /release or asks to cut/ship/publish a release.
---

# Release docker-magento

Automates the full release. You (Claude) do the judgment — pick the version and
write the changelog — then hand the mechanical git/gh work to
`.claude/skills/release/release.sh`, which stamps, commits, lands on `master`,
tags, and publishes.

There is exactly **one approval gate**: after you present the proposed version +
generated changelog + planned actions, wait for the user's go-ahead before
running the script (the irreversible push/tag/publish happens there). If the
user said something like "just do it" / "/release --yes", skip the pause.

## Preconditions (verify first; abort with a clear message if any fail)

- Current branch is `release/next`, clean working tree, in sync with `origin/release/next`.
- `release/next` is ahead of `master` (there is something to release).
- `gh` is authenticated, and the user is a repo admin (master is protected;
  only admins can fast-forward it directly).

Don't hand-fix these silently — tell the user what's wrong.

## Step 1 — Gather what's shipping

```bash
git fetch --quiet origin release/next master --tags
git log --no-merges --pretty='%s' origin/master..origin/release/next
```

Collect the PR numbers from the commit subjects (`(#1444)` etc.). For each,
read title, body, and labels to understand the change — do not rely on the
commit subject alone:

```bash
gh pr view <N> --json number,title,body,labels,url
```

Ignore pure-infra noise only if it truly doesn't affect users (but dependency
bumps like `actions/checkout` usually still warrant a one-line entry).

## Step 2 — Decide the version

Versioning is SemVer with a single-incrementing scheme (history: 53.0.0,
52.1.0, 52.0.2, …). From the change set:

- **Major** (`NN.0.0`) — any breaking or behavior-changing default: new default
  install target, removed/renamed scripts, changed socket paths, image
  defaults users must react to. docker-magento bumps major readily.
- **Minor** (`N.M.0`) — additive features, new images/scripts, no breaking change.
- **Patch** (`N.M.P`) — bug fixes, dependency bumps, docs/CI only.

Compute the next number from the **latest git tag**. State your reasoning in one
line. The user can override in the approval step.

## Step 3 — Generate the CHANGELOG entries (this is the automatic part)

Write entries **into the existing `## [Unreleased]` section** of `CHANGELOG.md`,
matching the project's established format exactly:

- Group under `### Added`, `### Changed`, `### Fixed`, `### Removed` (only the
  groups that apply, in that order).
- One bullet per change, written as editorial prose — say *what* changed and,
  where it matters, *why* / the user impact. Look at the `[53.0.0]` and
  `[52.x]` entries already in the file and match their voice and depth.
- End each bullet with inline links to the PR and any closed issue, e.g.
  `[PR #1444](https://github.com/markshust/docker-magento/pull/1444)`,
  `[#1404](https://github.com/markshust/docker-magento/issues/1404)`.
- Bug-fix PRs → `### Fixed`; `feat:` → `### Added`/`### Changed`; breaking →
  call it out explicitly (bold lead-in like the existing entries do).

Use the Edit tool to insert these bullets under `## [Unreleased]`. Do **not**
change the version heading or add a date — the script does that in Step 5.

## Step 4 — Present for approval

Show the user, concisely:
1. Proposed version + one-line rationale.
2. The changelog section you just wrote (rendered).
3. What will happen: commit to `release/next`, fast-forward `master`, tag
   `NN.N.N`, publish GitHub Release.

Then stop and wait for approval (unless the user pre-authorized).

## Step 5 — Execute

```bash
.claude/skills/release/release.sh <version> --yes
```

The script re-validates preconditions, stamps `## [Unreleased]` →
`## [<version>] - <date>` (leaving a fresh empty `## [Unreleased]`), bumps the
`## Version` line in `compose/compose.yaml`, commits as
`chore: prep <version> release`, pushes `release/next`, fast-forwards and pushes
`master`, tags, and creates the GitHub Release from the stamped changelog
section. It prints the release URL.

To preview without publishing, run with `--dry-run` instead of `--yes` — it
stamps, shows the diff and the exact release notes, then reverts.

## Step 6 — Report

Give the user the published release URL and the version shipped. If the script
aborted, relay its error verbatim and stop — don't try to force past a failed
precondition.

## Guardrails

- Never invent a changelog entry for a change you didn't find in a merged PR.
- Never bump the version past what the changes justify to "round up."
- If `[Unreleased]` would be empty (nothing user-facing merged), say so and
  ask whether to proceed — the script refuses an empty release anyway.
- The script pushes directly to `master`; that's intentional and admin-gated.
  Don't route it through a PR — the fast-forward is the release.
