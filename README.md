# Superpowers for GPT-5.6 Sol

[繁體中文](README.zh-TW.md)

A Codex-native, adaptive edition of [obra/superpowers](https://github.com/obra/superpowers/tree/main/skills), tuned for GPT-5.6 Sol. It keeps the original project's strongest engineering disciplines while removing workflow ceremony that modern Codex already handles natively.

## Why this version is better for Codex

`using-superpowers` starts with every conversation, so skill routing is always available. The router then loads only the smallest relevant skill set instead of forcing every task through the same design, planning, worktree, TDD, subagent, review, and branch-finishing chain.

- **80.5% less skill-body text:** 3,612 words across 14 `SKILL.md` files versus 18,516 upstream.
- **Codex-native execution:** uses native planning, subagents, approvals, tools, and shared-workspace semantics.
- **Proportional process:** applies TDD, worktrees, reviews, and delegation when they materially improve the result.
- **Lower coordination overhead:** keeps straightforward changes inline and delegates only substantial independent work.
- **Safer authorization boundaries:** preserves user changes and requires authority for destructive or externally visible actions.
- **No RTK dependency:** examples and validation scripts run with standard commands available in a normal development environment.

## Comparison with obra/superpowers

| Area | GPT-5.6 Sol edition | obra/superpowers |
| --- | --- | --- |
| Conversation startup | Always starts a lightweight skill router | Always checks and invokes applicable skills |
| Skill selection | Smallest sufficient set; no automatic process chain | Mandatory workflows and ordered skill transitions |
| Brainstorming | Used for ambiguous, high-impact choices | Required before every creative or behavior-changing task |
| Planning | Native planning for routine work; durable plans when a handoff is useful | Comprehensive plans with fine-grained steps and frequent commits |
| TDD | Used with testable behavior and a practical harness | Hard gate for nearly every feature, fix, and refactor |
| Subagents and review | Risk- and workload-driven | Fresh agents and staged reviews are central to the default workflow |
| Worktrees and delivery | Created only when isolation is requested or materially useful | Integrated into the standard implementation workflow |
| Verification | Fresh evidence proportional to the claim; avoids duplicate gates | Universal completion gate |
| Target environment | Codex CLI with GPT-5.6 Sol | Multiple agent harnesses |

The comparison is pinned to upstream commit [`d884ae0`](https://github.com/obra/superpowers/tree/d884ae04edebef577e82ff7c4e143debd0bbec99/skills) and measured with `wc -w` on the 14 skill bodies on 2026-07-11. This edition is better for its stated Codex target; the upstream project remains the broader cross-harness distribution.

## What's included

The tailored bundle lives in [`skills/superpowers`](skills/superpowers). See its [short profile](skills/superpowers/README.md) and [Traditional Chinese skill guide](skills/superpowers/GUIDE.md) for routing details and the full skill index.

Validate the skill metadata, shell syntax, and context budget after making changes. The bundle-level budget check is:

```bash
bash skills/superpowers/check-context-budget.sh
```

`skills/superpowers/sync-skills.sh` intentionally refuses to overwrite this profile unless `--replace-tailored` is passed.

## Upstream credit

This project is adapted from Jesse Vincent's [obra/superpowers](https://github.com/obra/superpowers). The narrower Codex focus, adaptive routing policy, compressed instructions, and Codex-specific tooling in this repository are the reasons to use this edition with GPT-5.6 Sol.
