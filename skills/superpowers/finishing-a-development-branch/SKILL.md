---
name: finishing-a-development-branch
description: Complete an authorized commit, push, integration, PR, branch, or worktree action while preserving user state. Use after relevant verification when the user or repository requires delivery.
---

# Finishing a Development Branch

Inspect status, branch, and worktree state with read-only commands. Preserve unrelated user changes.

Confirm the task diff is understood and relevant required checks are fresh for the state to deliver. Do not require a separate plan, log, or reconciliation artifact unless the user or repository does.

- If the user or repository policy already authorizes commit or push, perform it after verification.
- Ask one concise question only when merge, PR, push, retention, or cleanup authority remains unresolved.
- Do not switch branches, pull, merge into a base branch, create a PR, or force-push without corresponding authority.
- In a detached or externally managed workspace, report the exact limitation and preserve the work for the host workflow.
- Remove a worktree only when this session created it, the user authorized cleanup, and no required work remains inside it.

Never offer discard routinely. If requested, show the exact branch, unique commits, uncommitted files, and worktree path at risk; require confirmation containing `discard` for that target.

After delivery, report the checks run, commit or branch state, remote action, and anything deliberately preserved. Use repository command wrappers for every shell command.
