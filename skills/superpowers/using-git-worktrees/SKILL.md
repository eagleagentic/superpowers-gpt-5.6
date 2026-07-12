---
name: using-git-worktrees
description: "Create or reuse an isolated Git worktree for risky or concurrent implementation. Use when isolation is explicitly requested or required, or materially protects existing work during long-lived, parallel, or high-risk changes."
---

# Git Worktrees

Skip creation for short local changes that can safely preserve user work. Reuse the current checkout when it already provides appropriate isolation.

1. Read repository instructions and inspect Git status before changing state.
2. Detect whether the current checkout is a linked worktree or submodule; reuse valid existing isolation.
3. Prefer a Codex CLI or harness-native worktree mechanism. Fall back to `git worktree` only when no native mechanism exists.
4. Follow an explicit directory preference, then an established repository convention. For a project-local directory, verify it is ignored before creation.
5. Create a dedicated branch and worktree without disturbing existing changes.
6. Run only repository-documented setup commands; avoid blind dependency installation or lockfile mutation.
7. Run a cheap, relevant baseline check before implementation.

Do not edit `.gitignore` without authorization or silently work in place when isolation is required. Stop when overlapping changes, permissions, conflicts, or baseline failures make attribution unsafe; proceed with a known failure only when it is clearly unrelated and reported.

Report the path, branch, setup, baseline result, pre-existing failures, and confirmation that the original checkout and user work remain untouched.
