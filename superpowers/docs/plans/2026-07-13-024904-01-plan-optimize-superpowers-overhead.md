# Optimize Superpowers Runtime Overhead

## Plan

**Goal:** Reduce static and runtime workflow overhead while retaining risk-proportionate safety, authorization, and evidence.
**Why planning is required:** This changes activation and lifecycle contracts across the full 13-skill bundle, bilingual guides, validation, and published metrics.
**Acceptance:** The bundle is measurably smaller; routine work avoids mandatory durable artifacts and duplicate gates; high-risk work retains planning, review, isolation, and explicit verification when warranted; all repository checks pass.

### Outcome 1: Replace the universal lifecycle with risk-based routing
- Work: Give trivial and routine tasks a direct path; make durable plans, logs, review, and completion gates independently conditional on explicit need or material risk.
- Verify: inspect every changed description and the three scenario comparisons below.

### Outcome 2: Remove duplicated lifecycle ownership
- Work: Remove the mandatory lifecycle reference and repeated documentation-readiness/reconciliation rules from domain workflows while preserving their task-specific safeguards.
- Verify: `rg -n 'documentation readiness|canonical reconciliation|every fully implemented' skills/superpowers`

### Outcome 3: Keep public contracts and budgets accurate
- Work: Update the validator, guides, README metrics, and dashboard metrics only where revised behavior or measured counts make them stale.
- Verify: `bash skills/superpowers/check-context-budget.sh`

### Outcome 4: Validate behavior and delivery
- Work: Forward-test representative direct, routine, and high-risk scenarios; validate changed skill metadata; inspect the final diff; record the concise implementation log; commit and push only this task.
- Verify: changed-skill `quick_validate.py`, `git diff --check`, repository validation, final reconciliation, and remote status.

## Baseline

Measured on 2026-07-13 with `wc -w` through `check-context-budget.sh`:

| Skill | Words |
| --- | ---: |
| brainstorming | 300 |
| executing-plans | 216 |
| finishing-a-development-branch | 282 |
| receiving-code-review | 197 |
| requesting-code-review | 226 |
| systematic-debugging | 338 |
| test-driven-development | 332 |
| using-git-worktrees | 321 |
| using-superpowers | 197 |
| verification-before-completion | 315 |
| writing-implementation-logs | 177 |
| writing-plans | 277 |
| writing-skills | 224 |
| **Direct skill total** | **3,402** |
| **On-demand Markdown** | **2,178** |
| **All skill Markdown** | **5,580** |

Current activation edges are `using-superpowers` -> `writing-plans` for any native plan, `using-superpowers` -> the 523-word durable lifecycle reference for every persistent mutation, and that reference/router -> `writing-implementation-logs` for every completed mutation. `brainstorming` also forces `writing-plans`; 12 of 13 skill bodies repeat durable-record, documentation-readiness, or reconciliation ownership. `writing-skills` separately forces a complete built-in skill-creator read, all-support-resource audit, and fresh-session forward tests for bundle changes.

Scenario counts use **runtime instruction loads / required lifecycle artifacts / fresh test-or-check execution rounds**. They include `finishing-a-development-branch` because this repository requires commit and push; Git state inspection and final reporting are not additional test rounds.

| Scenario | Baseline | Target |
| --- | ---: | ---: |
| One-file documentation correction | 4 / 1 / 3 | 2 / 0 / 1 |
| Routine one- or two-file implementation using a lightweight native plan | 6 / 2 / 4 | 2 / 0 / 1 |
| High-risk cross-module or destructive change | 9 / 3 / 6 | 8 / 3 / 5 |

The high-risk target retains a durable plan, isolated branch/worktree when useful, focused review, an explicit multi-check completion gate, a durable log when audit or recovery warrants it, and authorized delivery. The reduction comes from removing the universal reference and duplicate reconciliation, not from removing safeguards.
