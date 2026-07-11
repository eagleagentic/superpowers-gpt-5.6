---
name: writing-plans
description: Create a concise, durable implementation plan with outcomes, ownership, dependencies, and verification. Use only when the user asks for a plan, work needs a resumable handoff, or dependent steps are too complex for a short native plan; do not use for routine implementation.
---

# Writing Plans

Prefer Codex's native plan for ordinary multi-step work. Write a plan document only when it will remain useful after the current turn.

## Build the Plan

1. Read the nearest `AGENTS.md`, the requirements, and the relevant code before planning.
2. State material assumptions and resolve ambiguities that would change scope or architecture.
3. Define the smallest set of independently verifiable outcomes, usually three to seven tasks.
4. Save the document only when the user requested it or another session needs it. Honor the user's path; otherwise use `docs/superpowers/plans/YYYY-MM-DD-<feature>.md`.

Use this compact structure:

```markdown
# <Feature> Implementation Plan

**Goal:** <one sentence>
**Constraints:** <only binding project requirements>
**Acceptance:** <observable completion criteria>

### Task N: <outcome>
- Files: <create/modify/test paths>
- Interfaces: <only cross-task contracts or ownership boundaries>
- Work: <what must become true>
- Verify: `<repo-specific command>`
```

Keep plans implementation-guiding, not implementation-duplicating:

- Do not include complete source code, routine imports, predicted test output, or repeated boilerplate.
- Do not split work into artificial two-minute steps or require a commit per step.
- Include exact signatures, data shapes, migrations, or error contracts only when another task depends on them.
- Follow repository conventions for testing, branching, command wrappers, and commits.

Review the plan once for requirement coverage, dependency order, scope creep, and unverifiable tasks. Fix issues inline.

If the user requested implementation, continue directly and track progress with the native plan. Delegate only independent work whose saved time exceeds the handoff cost; do not force an execution menu.
