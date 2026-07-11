# Codex CLI Essentials

Use the tools exposed by the current Codex session. Follow the nearest `AGENTS.md` and use `apply_patch` for file edits.

## Multi-agent work

- Delegate only concrete, bounded work that can proceed independently and materially improve speed or quality.
- Use `spawn_agent` for a new workstream, `send_message` for context, `followup_task` for another turn, `list_agents` for status, and `wait_agent` only when no useful local work remains.
- Agents share the workspace. Assign non-overlapping file ownership before parallel edits; parallel read-only investigation is safer.
- Keep skill-instruction reading, integration decisions, and final verification in the main agent.
- Prefer `update_plan` for shared progress. Keep agent prompts limited to goal, scope, constraints, acceptance criteria, verification, and a compact return format.

## Tool use

- Inspect before editing, preserve unrelated changes, and keep commentary updates concise.
- Run focused checks while working and fresh relevant checks before completion claims.
- Request approval only when sandbox policy or an external side effect requires it.

## Worktrees

Inspect the current environment before creating or finishing a branch:

```bash
git rev-parse --show-toplevel
git rev-parse --git-dir
git rev-parse --git-common-dir
git branch --show-current
git status --short
```

If the git directory differs from the common directory, the session is already in a linked worktree; avoid nesting another worktree. An empty branch name means detached HEAD, so do not assume branch, push, or PR operations are available. Create a worktree only when isolation is required and authorized.
