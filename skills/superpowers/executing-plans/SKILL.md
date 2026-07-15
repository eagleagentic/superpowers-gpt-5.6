---
name: executing-plans
description: Execute an existing plan when implementation is authorized and dependent outcomes need tracking; skip short routine checklists.
---

# Executing Plans

A plan's existence or approval to plan does not authorize implementation. Without implementation authority, inspect and report only.

1. Read the plan, nearest `AGENTS.md`, and relevant repository state.
2. Map unfinished outcomes into lightweight session tracking. Before tools, announce the first outcome; update the user only at material phase changes with the result and next outcome.
3. Implement the minimum change per outcome; batch checks when they prove the same behavior.
4. After the final change, run required checks and compare the diff with acceptance.

Treat the plan as an outcome contract, not a transcript. Adapt mechanics when repository reality differs while preserving scope and acceptance. Update a durable plan before continuing only when a material requirement, design, or verification strategy changes.

Later relevant mutations invalidate only affected evidence; rerun those checks before claiming completion.

Resolve recoverable failures with safe diagnostics and alternatives. Ask the user only when missing authority, an architectural choice, or ambiguous requirements would change the result.

Do not invoke another workflow skill solely because a plan exists.
