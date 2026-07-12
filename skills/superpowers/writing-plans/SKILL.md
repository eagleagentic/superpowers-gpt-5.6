---
name: writing-plans
description: Create a durable implementation plan for explicit durable-plan requests or complex, high-risk, cross-system, destructive, or long-running work needing resumable coordination; skip routine native planning.
---

# Durable Plans

Use a repository file only for cross-session survival or material risk and dependency coordination. A native plan alone does not require this file.

1. Read the nearest `AGENTS.md`, requirements, relevant code, and repository documentation convention.
2. Reuse a same-scope record or create `./superpowers/docs/plans/YYYY-MM-DD-HHMMSS-01-plan-<slug>.md`; keep that timestamp and slug stable.
3. Resolve material ambiguity, then record the smallest set of independently verifiable outcomes.

```markdown
# <Task title>

**Goal:** <one sentence>
**Why planning is required:** <material trigger>
**Acceptance:** <observable completion criteria>

### Outcome N: <result>
- Work: <what must become true>
- Verify: `<repo-specific command>`
```

Keep outcomes dependency-ordered and omit code, routine mechanics, predicted output, and artificial microsteps. Update the same plan only after a material requirement, scope, design, or verification-strategy change.

Create it before implementation. For destructive or external work, put recovery, stop conditions, and pre-execution checks in acceptance.

If the current mode forbids writes, name the intended path and create it only after writes are authorized. A durable plan does not automatically require a log, review, worktree, or separate completion gate; select each independently.
