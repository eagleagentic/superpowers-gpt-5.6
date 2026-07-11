---
name: dispatching-parallel-agents
description: Run independent ad hoc Codex investigations or workstreams concurrently with explicit ownership and one integration check. Use when at least two tasks outside a plan-execution workflow have no ordering dependency or shared mutable state and the expected time saving exceeds agent startup cost.
---

# Dispatching Parallel Agents

Parallelize only work that is genuinely independent. Codex agents have separate conversational context but share the same filesystem, working tree, branch, and external resources.

## Decide

Group work by root cause or subsystem. Keep work inline or sequential when agents would:

- edit the same file or generated artifact;
- mutate the same database, service, branch, or test fixture;
- depend on another agent's result;
- need nearly identical broad repository context;
- finish faster than a useful handoff can be written.

Prefer parallel read-only investigation. For parallel edits, assign disjoint file ownership or use explicitly authorized isolated worktrees.

## Dispatch

Use native `spawn_agent` with a unique task name. Use `fork_turns: "none"` for a self-contained prompt; include only the goal, paths, constraints, acceptance criteria, verification, and concise return format. Start work up to the available concurrency limit, then continue useful main-thread work instead of waiting immediately.

Require each agent to return:

- root cause or outcome;
- files inspected or changed;
- verification evidence;
- blockers or integration risks.

Use `followup_task` for a correction that belongs to the same workstream rather than starting a fresh agent.

## Integrate

Inspect results and actual diffs, check for overlapping changes, and resolve contradictions. Run one relevant integration check on the combined state. Do not accept summaries as proof and do not repeat a full suite for every independent result unless repository policy requires it.
