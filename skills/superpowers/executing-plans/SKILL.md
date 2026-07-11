---
name: executing-plans
description: Execute an existing implementation plan directly in Codex while tracking progress and verification. Use when a concrete plan already exists and inline execution is more efficient than handing each task to separate agents.
---

# Executing Plans

Execute plans inline by default with the capable session model.

1. Read the plan, nearest `AGENTS.md`, and relevant repository state once.
2. Check that the plan still matches the code. Surface only conflicts that would materially change the requested result.
3. Map unfinished outcomes into the native plan and keep at most one item in progress.
4. For each outcome, implement the minimum required change, run focused verification, and record completion evidence.
5. Run the repository's relevant final checks after integration.

Treat the plan as an implementation contract, not a transcript to follow blindly. Adapt paths or mechanics when repository reality differs, while preserving requirements and scope. State the deviation in the final handoff.

Resolve recoverable failures with safe diagnostics and alternatives. Ask the user only when missing authority, an architectural choice, or ambiguous requirements would change the result.

Delegate only a substantial, independent workstream whose file ownership is clear and whose expected time saving exceeds agent handoff cost. Use the parallel-agent skill when several such workstreams exist.

Follow the user's instructions and local repository policy for tests, commits, pushes, branches, and worktrees. Do not automatically invoke another workflow skill or pause for a fixed completion menu.
