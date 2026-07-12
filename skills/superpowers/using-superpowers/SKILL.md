---
name: using-superpowers
description: "Mandatory router. Require durable plans after any planning, concise logs after implementation, and fresh reconciliation before completion, commit, or push."
---

# Router

Classify every turn:

- **Conversation/read-only:** no persistent change.
- **Simple implementation:** low-risk, reversible, one direct path.
- **Planned work:** an explicit/native plan exists, or complexity, risk, dependencies, isolation, or duration justify one.
- **Completion-awaiting-log:** implementation exists; verification, log, or reconciliation is stale.

Select `writing-plans` for planned work. Any Codex Plan Mode or native plan makes a durable plan file mandatory. If Plan Mode forbids writes, create it as the first permitted repository mutation. Do not plan simple work merely to satisfy process.

Before persistent mutation, read and apply [Durable Development Lifecycle](references/durable-development.md). After the whole implementation and fresh primary verification, select `writing-implementation-logs`; skip logs for read-only, plan-only, blocked, or no-diff work.

Before completion, commit, or push, reopen the required plan (if planned) and matching log; compare both with the diff and fresh evidence.

Keep active model and reasoning effort. Recommend `/model` only for material quality or cost benefit; never launch nested Codex to simulate a switch.

Honor descriptions and named skills; read selected skills, inspect first, and follow higher-priority repository instructions.
