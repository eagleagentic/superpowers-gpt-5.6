---
name: using-git-worktrees
description: "Create or reuse an isolated Git worktree for risky or concurrent implementation. Use when isolation is explicitly requested or required, or materially protects existing work during long-lived, parallel, or high-risk changes."
---

## Trigger

- Use this skill when the user or repository requires a worktree.
- Use it when concurrent branches, a dirty primary checkout, or risky long-lived work makes isolation materially safer.

## Skip

- Skip worktree creation for short, local changes that can safely preserve current user work.
- Reuse the current workspace when it is already an appropriate linked worktree.

## Core Loop

1. Read repository instructions and inspect Git status before changing state.
2. Detect whether the current checkout is a linked worktree or submodule; reuse valid existing isolation.
3. Prefer a Codex CLI or harness-native worktree mechanism. Fall back to `git worktree` only when no native mechanism exists.
4. Follow an explicit directory preference, then an established repository convention. For a project-local directory, verify it is ignored before creation.
5. Create a dedicated branch and worktree without disturbing existing changes.
6. Run only repository-documented setup commands; avoid blind dependency installation or lockfile mutation.
7. Run a cheap, relevant baseline check before implementation.
8. For persistent work, satisfy documentation readiness inside the worktree before implementation, configuration, or test edits; synchronize material deviations before continuing.

## Escalation

- Do not edit or commit `.gitignore` without authorization; choose a safe alternative or ask.
- Do not silently work in place when required isolation cannot be created.
- Stop when overlapping user changes, permissions, branch conflicts, or baseline failures make attribution unsafe.
- Proceed with a known baseline failure only when it is clearly unrelated and reported.

## Evidence

- Report the worktree path, branch, setup performed, baseline command, result, and known pre-existing failures.
- Report the canonical record path used for persistent work.
- Confirm that the original checkout and user changes remain untouched.
