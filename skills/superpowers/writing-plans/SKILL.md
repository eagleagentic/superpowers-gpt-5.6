---
name: writing-plans
description: Create a durable plan when explicitly requested, required by the High-risk tier, or needed for resumable dependency coordination; skip routine native planning.
---

# Durable Plans

Use a repository file only when the High-risk tier requires it or for cross-session survival and material dependency coordination. A native plan alone does not require this file.

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

Create it before implementation. For destructive or consequential external-state work, put recovery, stop conditions, and pre-execution checks in acceptance. For production-data work, include target, approvals, dry-run counts, backup/restore evidence, integrity checks, batch/abort thresholds, and sensitive-output hygiene. For production deployment, include target revision, approvals, rollout, health evidence, rollback, and monitoring stop conditions.

If the current mode forbids writes, name the intended path and create it only after writes are authorized. A durable plan does not automatically require a log, review, worktree, or separate completion gate; select each independently.
