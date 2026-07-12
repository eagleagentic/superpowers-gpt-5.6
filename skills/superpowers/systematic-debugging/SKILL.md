---
name: systematic-debugging
description: "Diagnose technical failures with evidence-driven root-cause analysis and minimal hypothesis tests. Use when a bug, failing test, build error, performance regression, or unexpected behavior has an unclear cause."
---

## Trigger

- Use this skill when the cause of a technical failure is unknown, disputed, intermittent, or repeatedly misdiagnosed.
- Use it when a previous fix failed or moved the symptom.

## Skip

- Skip the full workflow when the failure is an expected consequence of the current edit and the cause is already demonstrated.
- Skip unrelated cleanup, speculative refactoring, and broad instrumentation.

## Core Loop

1. Reproduce the failure with the narrowest reliable command or observation. Read the exact error, stack, inputs, and exit status.
2. Inspect only relevant evidence: recent diffs, the failing path, configuration, data origin, dependencies, and a working analogue when useful. Read [root-cause-tracing.md](root-cause-tracing.md) only when the value or side effect crosses multiple callers.
3. State one falsifiable root-cause hypothesis and the evidence supporting it.
4. Run the cheapest discriminating check. Change one variable at a time.
5. Before an authorized persistent fix or test edit, satisfy documentation readiness. Synchronize material root-cause-driven deviations before continuing.
6. Apply the smallest fix at the demonstrated source. Avoid bundled improvements.
7. Add a focused regression test when practical, then rerun the original reproduction and proportionate regression checks.

## Escalation

- Gather targeted diagnostics instead of guessing when reproduction is intermittent; never expose secrets or sensitive values.
- Instrument only suspected component boundaries in multi-component systems, then remove temporary diagnostics when appropriate.
- Read [condition-based-waiting.md](condition-based-waiting.md) only for sleep-based async flakiness.
- Read [defense-in-depth.md](defense-in-depth.md) only after proving a root cause that warrants additional boundary guards.
- Reassess assumptions, boundaries, and architecture after repeated disproven hypotheses.
- Ask the user only when the next action changes scope, requires new authority, or implies an architectural decision.

## Evidence

- Capture the before-and-after reproduction, confirmed hypothesis, relevant command results, and remaining uncertainty.
- Claim resolution only after final verification and durable reconciliation; later relevant mutations invalidate both.
