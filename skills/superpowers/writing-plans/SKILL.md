---
name: writing-plans
description: Create mandatory durable plans. Use after any explicit/native planning and for complex, important, high-risk, dependent, cross-system, isolated, destructive, or long-running work; skip low-risk single-path work.
---

# Writing Plans

Any explicit or native planning makes a durable task file mandatory. A native plan may track session progress but never substitutes for that file.

1. Read the nearest `AGENTS.md`, requirements, relevant code, and repository documentation convention.
2. Inspect `./superpowers/docs/plans/` for a plan in the same scope; otherwise create `./superpowers/docs/plans/YYYY-MM-DD-<slug>.md`.
3. If Plan Mode forbids writes, name the target path and create it as the first permitted repository mutation before implementation.
4. Resolve material ambiguity, then record the smallest set of independently verifiable outcomes.

Use this structure:

```markdown
# <Task title>

## Plan

**Goal:** <one sentence>
**Why planning is required:** <material trigger>
**Acceptance:** <observable completion criteria>

### Outcome N: <result>
- Work: <what must become true>
- Verify: `<repo-specific command>`
```

Keep it implementation-guiding: omit source code, routine imports, predicted output, repeated boilerplate, artificial microsteps, and per-step commits. Include exact contracts only when another outcome depends on them.

Review once for requirement coverage, dependency order, scope creep, and unverifiable outcomes. Before continuing after material requirement, design, scope, review, or verification-strategy changes, update the same plan and preserve the original intent.

Do not create a plan for simple work merely to satisfy process. Once any plan exists, however, never downgrade the durable requirement. If implementation is authorized, continue through the loaded lifecycle; completion writes the matching Implementation Log in `./superpowers/docs/logs/`.
