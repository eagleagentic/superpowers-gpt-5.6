---
name: verification-before-completion
description: "Validate implementation claims with fresh, proportional evidence. Use before a final handoff or explicit success claim, and before a delivery action only when no active workflow already provides the same verification gate."
---

## Trigger

- Verify before making an explicit success claim or performing a delivery action.
- Verify again after any relevant code, test, dependency, configuration, or environment change.

## Skip

- Skip duplicate runs when nothing relevant changed and current evidence still proves the same scoped claim.
- Skip unrelated or disproportionately expensive suites unless repository policy or change risk requires them.

## Core Loop

1. Define the exact claim and the command or inspection that proves it.
2. Run the narrowest sufficient check after the final relevant change.
3. Inspect the exit status, failure count, and meaningful warnings; do not infer success from partial output.
4. Review the diff and requested acceptance criteria for omissions.
5. State only what the evidence proves.

## Escalation

- Run broader checks when risk, cross-cutting impact, or repository instructions justify them.
- Treat agent reports as leads; inspect material changes and verify them independently.
- Do not revert or disturb user work solely to demonstrate a failing test.
- Report blocked, unavailable, flaky, or failing checks instead of claiming success.

## Evidence

- Include the verification command, result summary, and scope in the handoff.
- Distinguish verified outcomes from unverified assumptions and pre-existing failures.
