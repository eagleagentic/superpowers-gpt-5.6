---
name: using-superpowers
description: "Use when starting any conversation to select the smallest relevant Codex skill set before responding or acting."
---

## Trigger

- Invoke a user-named skill.
- Invoke a skill whose description clearly matches the requested work.

## Skip

- Skip speculative matches and routine Q&A, status, or read-only inspection that does not match a review or diagnostic skill.
- Skip discovery for a bounded subagent task unless the parent names a skill.

## Core Loop

1. Select the smallest sufficient skill set.
2. Read each selected skill once before acting.
3. Announce the skill and purpose briefly.
4. Follow only instructions relevant to the current scope.
5. Trust GPT-5.6 Sol and Codex CLI for ordinary reasoning, exploration, and tool selection.

## Escalation

- Add another skill only when new work independently matches its description.
- Never chain process skills automatically.
- Read `references/codex-tools.md` only when Codex agent or worktree mechanics are needed.
- Follow system, developer, user, and repository instructions before skill guidance.

## Evidence

- Keep usage observable through the initial announcement.
- Report any skill-caused pause or blocker explicitly.
