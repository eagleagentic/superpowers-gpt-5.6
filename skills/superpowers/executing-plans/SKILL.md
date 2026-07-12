---
name: executing-plans
description: Execute an existing implementation plan directly in the active Codex session while tracking progress and verification. Use when a concrete plan already exists and implementation is authorized.
---

# Executing Plans

Execute plans inline with the active session model.

1. Read the plan, durable task file, nearest `AGENTS.md`, and relevant repository state once.
2. Materialize any chat/native plan before implementation; if writes are forbidden, make the task file the first permitted repository mutation.
3. Map unfinished outcomes into the native plan and keep at most one item in progress.
4. For each outcome, implement the minimum required change, run focused verification, and record completion evidence.
5. Run final checks and reconcile the actual diff, acceptance, evidence, outcome, and limitations.

Treat the plan as an implementation contract, not a transcript to follow blindly. Adapt paths or mechanics when repository reality differs, while preserving requirements and scope.

Native item completion is candidate status only. Any later relevant mutation invalidates affected evidence and reconciliation.

Resolve recoverable failures with safe diagnostics and alternatives. Ask the user only when missing authority, an architectural choice, or ambiguous requirements would change the result.

Follow the user's instructions and local repository policy for tests, commits, pushes, branches, and worktrees. Do not automatically invoke another workflow skill or pause for a fixed completion menu.
