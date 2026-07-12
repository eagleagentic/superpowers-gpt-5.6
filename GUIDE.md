# Codex Superpowers Skill Guide

[繁體中文](GUIDE.zh-TW.md) · [README](README.md) · [Browse Skills](skills/superpowers)

This adaptive profile is tailored for Codex CLI and the GPT-5.6 family. Skills add only the workflow knowledge a task needs; they do not replace user instructions, the nearest `AGENTS.md`, Codex's native capabilities, or domain-specific skills.

## Skill index

| Skill | Capability | Trigger |
| --- | --- | --- |
| [`brainstorming`](skills/superpowers/brainstorming/SKILL.md) | Converge requirements and design choices | Use when a design needs exploration, requirements remain ambiguous, or a behavior change has material tradeoffs. |
| [`executing-plans`](skills/superpowers/executing-plans/SKILL.md) | Execute an existing plan inline | Use when an implementation-ready plan exists and the main agent can complete it efficiently in the current session. |
| [`finishing-a-development-branch`](skills/superpowers/finishing-a-development-branch/SKILL.md) | Complete authorized branch delivery | Use after verified implementation when the user or repository policy requires an authorized integration, push, PR, branch, or worktree action. |
| [`receiving-code-review`](skills/superpowers/receiving-code-review/SKILL.md) | Verify and address review feedback | Use when review findings must be validated, rejected with evidence, or implemented without expanding scope. |
| [`requesting-code-review`](skills/superpowers/requesting-code-review/SKILL.md) | Run a risk-driven review | Use when the user requests review or a change affects security, data, concurrency, public APIs, or multiple modules. |
| [`systematic-debugging`](skills/superpowers/systematic-debugging/SKILL.md) | Find root causes with evidence | Use for a bug, failing test, or unexpected behavior whose cause has not been proven. |
| [`test-driven-development`](skills/superpowers/test-driven-development/SKILL.md) | Protect observable behavior with tests | Use for new behavior or reproducible bug fixes when the repository has a practical automated test harness. |
| [`using-git-worktrees`](skills/superpowers/using-git-worktrees/SKILL.md) | Create an isolated workspace | Use when requested or required, or when long-lived, parallel, or high-risk work materially benefits from isolation. |
| [`using-superpowers`](skills/superpowers/using-superpowers/SKILL.md) | Route this workflow skill set | Use at the start of every conversation to select the smallest relevant skill set before responding or acting. |
| [`verification-before-completion`](skills/superpowers/verification-before-completion/SKILL.md) | Support completion claims with fresh evidence | Use before final handoff or a success claim when no active workflow already provides the same verification gate. |
| [`writing-implementation-logs`](skills/superpowers/writing-implementation-logs/SKILL.md) | Record a verified implementation outcome | Use once after persistent implementation and primary verification complete. |
| [`writing-plans`](skills/superpowers/writing-plans/SKILL.md) | Produce a durable implementation plan | Use when the user requests a plan or complex work needs a resumable, cross-session handoff. |
| [`writing-skills`](skills/superpowers/writing-skills/SKILL.md) | Maintain the Codex Superpowers bundle | Use when the user names `writing-skills` or asks to maintain this bundle; use Codex's built-in `skill-creator` for general skill authoring. |

## Model selection and delegation

Runtime skills remain model-family neutral. Select the active model with `/model`; this profile supports `gpt-5.6-sol`, `gpt-5.6-terra`, and `gpt-5.6-luna`. Check current availability, pricing, and caching guidance in the [API pricing](https://developers.openai.com/api/docs/pricing), [latest-model](https://developers.openai.com/api/docs/guides/latest-model), and [prompt-caching](https://developers.openai.com/api/docs/guides/prompt-caching) documentation, plus the [ChatGPT model](https://learn.chatgpt.com/docs/models) and [subagent](https://learn.chatgpt.com/docs/agent-configuration/subagents) references.

Codex Ultra provides native subagent delegation by default. This bundle intentionally removes custom agent-dispatch skills and templates so it does not duplicate Codex's orchestration layer.

## Adaptive selection

1. Start `using-superpowers` with every conversation, then select the smallest set whose metadata directly matches the task.
2. Do not chain design, planning, worktree, TDD, review, or branch-finishing workflows merely because they might help.
3. Use Codex Ultra's native delegation when needed; do not restore bundle-level dispatch workflows.
4. Scale planning and verification to risk; documentation and mechanical changes do not need a full development ceremony.
5. Before claiming completion, provide fresh evidence proportional to the claim without repeating irrelevant checks.

Run `bash skills/superpowers/check-context-budget.sh` to verify the skill count and context budget.
