# Codex Superpowers Skill Guide

[繁體中文](GUIDE.zh-TW.md) · [README](README.md) · [Browse Skills](skills/superpowers)

This newcomer-safe profile is tailored for Codex CLI and the GPT-5.6 family. Users can state only the desired outcome: the router supplies the mandatory implementation baseline and adds specialized workflows by risk. Skills do not replace user instructions, the nearest `AGENTS.md`, Codex's native capabilities, or domain-specific skills.

## Skill index

| Skill | Capability | Trigger |
| --- | --- | --- |
| [`brainstorming`](skills/superpowers/brainstorming/SKILL.md) | Converge requirements and design choices | Use when materially different interpretations would change scope, architecture, or consequential outcomes; the user need not ask to brainstorm. |
| [`executing-plans`](skills/superpowers/executing-plans/SKILL.md) | Execute a substantial plan inline | Use when implementation is authorized and an existing plan has dependent outcomes that benefit from explicit tracking. |
| [`finishing-a-development-branch`](skills/superpowers/finishing-a-development-branch/SKILL.md) | Complete authorized branch delivery | Use after verified implementation when the user or repository policy requires an authorized integration, push, PR, branch, or worktree action. |
| [`receiving-code-review`](skills/superpowers/receiving-code-review/SKILL.md) | Verify and address review feedback | Use for incoming reviewer feedback; evaluation-only requests stay read-only, and fixes require implementation authority. |
| [`requesting-code-review`](skills/superpowers/requesting-code-review/SKILL.md) | Run a risk-driven review | Use for an independent review before integration, not incoming feedback, when requested or warranted by material risk. |
| [`systematic-debugging`](skills/superpowers/systematic-debugging/SKILL.md) | Find root causes with evidence | Use for an unclear bug, failure, regression, or unexpected behavior; diagnosis-only requests stay read-only. |
| [`test-driven-development`](skills/superpowers/test-driven-development/SKILL.md) | Implement through red-green-refactor | Use for authorized work when requested or required, or when a cheap red test disambiguates implementation or captures a confirmed regression. |
| [`using-git-worktrees`](skills/superpowers/using-git-worktrees/SKILL.md) | Create an isolated workspace | Use when requested or required, or when long-lived, parallel, or high-risk work materially benefits from isolation. |
| [`using-superpowers`](skills/superpowers/using-superpowers/SKILL.md) | Enforce safe workflow defaults | Use every conversation; only provably non-behavioral work is Mechanical, all other implementations are Standard, and High-risk adds safeguards. |
| [`verification-before-completion`](skills/superpowers/verification-before-completion/SKILL.md) | Gate difficult completion claims | Use for High-risk work or independent material claims needing reconciliation; routine command sets alone do not trigger it. |
| [`writing-implementation-logs`](skills/superpowers/writing-implementation-logs/SKILL.md) | Record a verified implementation outcome | Use for a required durable record or consequential irreversible work needing audit or recovery; skip ordinary changes. |
| [`writing-plans`](skills/superpowers/writing-plans/SKILL.md) | Produce a durable implementation plan | Use when explicitly requested, required by High-risk, or needed for resumable dependency coordination. |
| [`writing-skills`](skills/superpowers/writing-skills/SKILL.md) | Maintain the Codex Superpowers bundle | Use to create, edit, or audit this bundle; use Codex's built-in `skill-creator` for general skill authoring. |

## Usage examples

Users do not need to know skill names. Describe the outcome; the router enforces the core loop and selects any additional workflow justified by risk.

### 1. I am not sure which skill applies

```text
I need to change the login flow. Inspect the repository, identify the risks and ambiguities, and tell me which workflow you will use before editing.
```

`using-superpowers` routes the task. Any non-mechanical login implementation follows Standard: inspect, state a brief plan and acceptance, implement with practical focused coverage, run checks, and review the final diff. Add `brainstorming` when materially different interpretations would change the result.

### 2. A test or behavior is failing

```text
The empty-page pagination test fails intermittently. Reproduce it, trace the root cause, make the smallest fix, and run a regression check.
```

`systematic-debugging` owns root-cause analysis. Once the cause and expected behavior are trustworthy, `test-driven-development` owns mutation order when a cheap red test disambiguates the fix or captures the confirmed regression—even if the user never names TDD.

### 3. I want an evidence-based review

```text
Review my unstaged changes for data-loss, public-contract, and missing-test risks. Do not edit files; report actionable findings with file and line evidence.
```

`requesting-code-review` keeps an independent review read-only and focused. `receiving-code-review` evaluates incoming findings; it applies supported fixes only when implementation is authorized.

### 4. The change is ready to hand off

```text
The implementation is complete. Verify the claims, record the implementation log, and prepare the authorized branch delivery.
```

`verification-before-completion` gathers fresh evidence, `writing-implementation-logs` records the result, and `finishing-a-development-branch` handles commit, push, or other delivery actions only when authorized.

### Complete walkthrough: add a report export

Start with one outcome-oriented request:

```text
Add CSV export for the existing report. First resolve any material design questions and write a durable plan, then implement it with focused tests, verify the final behavior, and summarize what changed.
```

The expected flow is:

1. `using-superpowers` routes the request; `brainstorming` resolves only material choices such as delimiter, escaping, or output ownership.
2. `writing-plans` records the acceptance criteria and verification strategy. Do not start implementation until the plan exists.
3. With implementation authorized, `executing-plans` works through the outcomes. Use `test-driven-development` when a cheap red test disambiguates implementation or captures a confirmed regression; otherwise add focused coverage directly when practical.
4. Run focused tests and the repository's required checks. Reconcile the actual diff with the plan and acceptance criteria.
5. `writing-implementation-logs` records the verified outcome. Use `finishing-a-development-branch` only if commit or push is authorized.

Without the prompt's explicit durable-plan requirement, every non-mechanical implementation still follows Standard. Only a provably non-behavioral edit takes the Mechanical path.

## Model selection and delegation

Runtime skills remain model-family neutral. Select the active model with `/model`; this profile supports `gpt-5.6-sol`, `gpt-5.6-terra`, and `gpt-5.6-luna`. Check current availability, pricing, and caching guidance in the [API pricing](https://developers.openai.com/api/docs/pricing), [latest-model](https://developers.openai.com/api/docs/guides/latest-model), and [prompt-caching](https://developers.openai.com/api/docs/guides/prompt-caching) documentation, plus the [ChatGPT model](https://learn.chatgpt.com/docs/models) and [subagent](https://learn.chatgpt.com/docs/agent-configuration/subagents) references.

Codex Ultra provides native subagent delegation by default. This bundle intentionally removes custom agent-dispatch skills and templates so it does not duplicate Codex's orchestration layer.

## Adaptive selection

1. Start `using-superpowers` with every conversation and choose the highest applicable tier; uncertainty moves up, never down.
2. Direct execution is limited to provably non-behavioral Mechanical edits. Every other implementation follows Standard; High-risk includes Standard and adds safeguards.
3. Standard must inspect context, state a brief plan and acceptance, implement narrowly with practical focused coverage, run focused checks, review the final diff, and report evidence.
4. Skill activation never grants mutation or external-action authority. Diagnosis-, evaluation-, and plan-only requests stay read-only.
5. Reclassify only when inspection reveals new scope or risk and before consequential external action. Reuse fresh evidence unless relevant state changed or a claim remains unproved.
6. High-risk requires a durable plan and explicit verification; add review, isolation, production-data, or deployment controls only for their named risks.
7. Load extra workflows only by tier or matching outcome-based metadata. Native plans do not require durable files, and ordinary implementations do not require logs.
8. Use Codex Ultra's native delegation when needed; do not restore bundle-level dispatch workflows.

Run `bash skills/superpowers/check-context-budget.sh` to verify the skill count and context budget.
