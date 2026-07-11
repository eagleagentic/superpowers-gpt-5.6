---
name: subagent-driven-development
description: Execute an implementation plan through bounded Codex subagents with clear ownership and concise evidence. Use only when planned workstreams are substantial and independent enough that delegation is faster than direct GPT-5.6 Sol execution without shared-workspace conflicts.
---

# Subagent-Driven Development

Default to direct implementation. Delegate only when independent work will repay dispatch and integration cost.
This skill owns plan-specific concurrency; do not also load `dispatching-parallel-agents`.

## Prepare

1. Read the plan and local instructions.
2. Split work by outcome and file ownership, not tiny plan steps.
3. Keep coupled tasks inline or sequential; agents share filesystem and git state.
4. Track outcomes with the native plan, not a separate ledger.

For an unusually long plan at compaction risk, use `scripts/task-brief` and
`scripts/review-package` for file handoffs. Skip these scratch artifacts otherwise.

## Dispatch

Use Codex's native `spawn_agent`. For a self-contained task, use `fork_turns: "none"` and pass only:

- goal;
- workspace and files to read or own;
- binding constraints and acceptance criteria;
- focused verification command;
- output contract.

Do not select a model, paste history, duplicate a plan, or require commits. Use [implementer-prompt.md](implementer-prompt.md).

Run read-only investigations concurrently. Run editing agents concurrently only when their owned files and mutable resources do not overlap; otherwise sequence them or use explicitly authorized isolated worktrees.

## Integrate

Inspect each result and diff. Require changed files, verification commands, results, and concerns. Use `followup_task` with the same agent for corrections.

Review only when independent judgment adds value: use [task-reviewer-prompt.md](task-reviewer-prompt.md) for a risky task or requesting-code-review for an integrated change. Keep reviews read-only and validate findings.

Run relevant checks once on the combined state. Follow local policy for commits, pushes, branches, and worktrees.

Stop only for missing authority, a true shared-state conflict, or an ambiguity that changes the requested result. Otherwise continue until all native plan items are complete.
