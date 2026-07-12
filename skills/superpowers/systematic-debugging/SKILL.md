---
name: systematic-debugging
description: "Diagnose unclear bugs, failing tests, build errors, regressions, or unexpected behavior with evidence. Fix only when implementation is authorized."
---

# Systematic Debugging

Use the full loop when the cause is unknown, disputed, intermittent, repeatedly misdiagnosed, or a previous fix moved the symptom. If the current edit already demonstrates the cause, diagnose and verify directly.

For diagnosis-only requests, stop after confirming or bounding the cause; do not edit.

1. Reproduce the failure with the narrowest reliable command or observation. If no reliable reproduction is possible, collect stable observations and identify missing evidence; do not guess at a fix.
2. Inspect only relevant evidence: recent diffs, the failing path, configuration, data origin, dependencies, and a working analogue when useful.
3. State one falsifiable root-cause hypothesis and the evidence supporting it.
4. Run the cheapest discriminating check. Change one variable at a time.
5. When implementation is authorized, capture a focused failing regression test before the fix when practical. If `test-driven-development` independently matches, it owns red-green mutation order. Apply the smallest fix at the demonstrated source; avoid bundled cleanup.
6. Rerun the reproduction and proportionate regression checks.

Read [root-cause-tracing.md](root-cause-tracing.md) only when a value or side effect crosses multiple callers, [condition-based-waiting.md](condition-based-waiting.md) only for sleep-based async flakiness, and [defense-in-depth.md](defense-in-depth.md) only after proving a root cause that warrants more guards.

Use targeted diagnostics without exposing secrets; remove temporary instrumentation. Ask only when the next action changes scope, authority, or architecture. Report the confirmed cause, before-and-after reproduction, checks, and remaining uncertainty.
