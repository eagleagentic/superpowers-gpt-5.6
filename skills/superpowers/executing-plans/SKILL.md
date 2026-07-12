---
name: executing-plans
description: Execute an authorized multi-step or durable implementation plan in the active session. Use when dependent outcomes need tracking; skip short routine checklists that Codex can execute directly.
---

# Executing Plans

1. Read the plan, nearest `AGENTS.md`, and relevant repository state once.
2. Map unfinished outcomes into lightweight session tracking and keep at most one in progress.
3. Implement the minimum required change for each outcome; batch checks when that proves the same behavior more efficiently.
4. After the final relevant change, run the plan's required checks and compare the actual diff with acceptance once.

Treat the plan as an outcome contract, not a transcript. Adapt mechanics when repository reality differs while preserving scope and acceptance. Update a durable plan before continuing only when a material requirement, design, or verification strategy changes.

Later relevant mutations invalidate only affected evidence; rerun those checks before claiming completion.

Resolve recoverable failures with safe diagnostics and alternatives. Ask the user only when missing authority, an architectural choice, or ambiguous requirements would change the result.

Do not invoke another workflow skill solely because a plan exists.
