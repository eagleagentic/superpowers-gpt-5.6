---
name: finishing-a-development-branch
description: Complete an authorized git integration, push, pull-request, branch, or worktree action while preserving user state. Use only when implementation is verified and repository policy or the user requires a branch-completion decision.
---

# Finishing a Development Branch

Follow explicit user instructions and the nearest `AGENTS.md`; do not impose a fixed completion menu.

## Inspect and Verify

Inspect the actual state with read-only commands such as `git status --short`, `git branch --show-current`, and `git worktree list`. Preserve unrelated user changes.

Confirm checks pass and canonical reconciliation is fresh for the exact state to commit or push. Missing or stale reconciliation blocks both actions.

Any later relevant mutation invalidates affected evidence and reconciliation; refresh both before continuing.

## Complete the Authorized Action

- If the user or repository policy already authorizes commit or push, perform it after verification.
- Ask one concise question only when merge, PR, push, retention, or cleanup authority remains unresolved.
- Do not switch branches, pull, merge into a base branch, create a PR, or force-push without corresponding authority.
- In a detached or externally managed workspace, report the exact limitation and preserve the work for the host workflow.
- Remove a worktree only when this session created it, the user authorized cleanup, and no required work remains inside it.

## Destructive Actions

Never offer discard routinely. If requested, show the exact branch, unique commits, uncommitted files, and worktree path that would be lost. Require confirmation containing `discard` before deleting them. Approval applies only to the named target.

After the authorized action, report the canonical record, checks run, commit or branch state, remote action, and anything deliberately preserved. Use repository command wrappers for every shell command.
