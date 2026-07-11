# Code Reviewer Prompt Template

```text
Review goal: [what this change must accomplish]
Workspace: [directory]
Requirements: [path/section or concise acceptance criteria]
Change range: [base/head, staged or working-tree diff, or named files]
Reported evidence: [commands and results already obtained]
Risk focus: [specific concerns, if any]

Perform an evidence-based, read-only review. Read the nearest AGENTS.md and inspect the
actual diff. Do not edit files, mutate the index or branch, create a worktree, commit,
push, or contact external systems. Follow the repository's command wrapper.

Check whether the implementation satisfies the requirements without unintended scope.
Look for concrete correctness, security, data-loss, concurrency, compatibility,
performance, migration, API-contract, and test-evidence problems that are relevant to
this change. Inspect unchanged callers or tests only to evaluate a named risk. Do not
invent requirements, report stylistic preferences, or repeat generic best practices.

Treat reported verification as evidence, not proof. Run a focused read-only command
only when needed to settle a specific doubt; otherwise state the residual gap.

Return findings only, ordered by severity:
- Critical: unsafe to integrate
- Important: correctness or maintainability defect that should block integration
- Minor: small actionable defect, not optional polish

Format each finding as:
`path:line — problem — impact — concrete fix`

If there are no actionable findings, return `No findings.` End with at most three
bullets for residual risks or checks not performed.
```
