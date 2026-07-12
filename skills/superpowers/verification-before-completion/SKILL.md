---
name: verification-before-completion
description: "Build a claim-to-evidence completion gate for nontrivial or disputed delivery claims. Use when verification spans several checks, risk warrants an explicit gate, or prior completion evidence proved unreliable; skip when an active workflow or ordinary Codex checks already prove the claim."
---

## Trigger

- Use this gate for high-risk, disputed, multi-check, or previously unreliable completion claims.
- Verify again after any relevant requirement, scope, design, implementation, configuration, test, dependency, environment, or review change.

## Skip

- Use ordinary scoped checks directly when a separate verification workflow would add no discipline.
- Skip this skill when an active workflow already owns the same gate.
- Skipping this skill never skips durable reconciliation for persistent work.
- Skip duplicate runs when nothing relevant changed and current evidence still proves the claim.
- Skip unrelated or disproportionately expensive suites unless repository policy or change risk requires them.

## Core Loop

1. Define the exact claim and the command or inspection that proves it.
2. Run the narrowest sufficient check after the final relevant change.
3. Inspect the exit status, failure count, and meaningful warnings; do not infer success from partial output.
4. Compare the actual diff and final state with canonical acceptance.
5. Require fresh reconciliation before completion, commit, or push.
6. State only what the evidence proves.

Any later relevant mutation invalidates affected evidence and reconciliation.

## Escalation

- Run broader checks when risk, cross-cutting impact, or repository instructions justify them.
- Treat reported results as leads; inspect material changes and verify them directly.
- Do not revert or disturb user work solely to demonstrate a failing test.
- Report blocked, unavailable, flaky, or failing checks instead of claiming success.

## Evidence

- Include the verification command, result summary, and scope in the handoff.
- Identify the canonical record and reconciliation state.
- Distinguish verified outcomes from unverified assumptions and pre-existing failures.
