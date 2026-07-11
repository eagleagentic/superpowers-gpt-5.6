# Task Reviewer Prompt Template

Use only when an independent, task-scoped review is worth the handoff cost.

```text
Review goal: [task outcome]
Workspace: [directory]
Requirements: [brief/path and relevant section]
Change range: [base/head, staged diff, or named files]
Reported evidence: [verification command and result]
Risk focus: [specific contract, security, data, concurrency, or integration risk]

Perform a read-only review. Do not edit files, alter git state, create a worktree,
commit, or push. Read the nearest AGENTS.md and inspect the actual diff. Check relevant
unchanged callers or tests only when a concrete risk requires it. Treat reported test
results as evidence, not proof; run a focused read-only check only if needed to resolve
a specific doubt, and follow the repository's command wrapper.

Compare the change with the stated requirements. Look for incorrect behavior, missing
requirements, unintended scope, regressions, unsafe error handling, and tests that do
not demonstrate the claimed behavior. Do not produce style preferences or generic
recommendations.

Return findings only, ordered Critical, Important, then Minor:
- `path:line — issue — impact — concrete fix`

If no actionable finding exists, return `No findings.` Then list any residual risk or
verification gap in at most three bullets. Keep the entire response concise.
```
