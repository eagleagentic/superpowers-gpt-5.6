# Implementer Prompt Template

Use this compact prompt with Codex `spawn_agent`. Omit sections that do not add task-specific information.

```text
Goal: [observable outcome]
Workspace: [directory]
Scope/ownership: [files or subsystem this agent may change]

Read first:
- [requirements or plan section]
- [relevant source/test paths]
- the nearest AGENTS.md

Constraints:
- [binding technical or product constraints]
- Preserve unrelated user changes and existing repository style.
- Agents share the filesystem and git state; do not edit outside ownership.
- Do not commit, push, create worktrees, or change branches unless explicitly instructed.

Acceptance:
- [behavior that must be true]

Verification:
- [focused repository-specific command]

Implement the minimum scoped change. Inspect the repository instead of guessing.
Resolve routine uncertainty yourself; report only an ambiguity that would change the
requested result or authority. Verify the final state before returning.

Return no more than eight lines:
- Status: DONE | BLOCKED
- Files changed
- Verification command and result
- Concerns or blocker evidence, if any
```
