---
name: test-driven-development
description: "Develop testable production behavior in small red-green-refactor slices. Use when implementing new behavior or fixing a reproducible bug in a repository with a practical automated test harness."
---

## Trigger

- Use this skill for testable production behavior changes and reproducible regressions.
- Use an existing failing test as the red state when it accurately captures the requirement.

## Skip

- Skip test-first work for documentation, configuration-only changes, generated code, disposable prototypes, or behavior that cannot be exercised by the available harness.
- Use a green-before-and-after check instead for behavior-preserving refactors.

## Core Loop

1. Define one observable behavior and its boundary.
2. Write or identify one focused test for that behavior.
3. Run it and confirm that it fails for the intended missing behavior, not a setup or syntax error.
4. Implement the smallest production change that can pass it.
5. Run the focused test and confirm it passes.
6. Refactor only when useful, keep the focused test green, and repeat for the next behavior.

## Escalation

- State why an automated test is impractical, then use the strongest available boundary, integration, compile, or manual check.
- Never delete or overwrite pre-existing or user-written code solely because test-first ordering was not followed.
- Mock only necessary boundaries; prefer observable behavior over implementation details.
- Read [testing-anti-patterns.md](testing-anti-patterns.md) only when adding mocks, doubles, or test-only production APIs.
- Stop and simplify the interface when test setup becomes disproportionate to the behavior.

## Evidence

- Retain the red failure reason and the green command result for each material behavior.
- After the final slice, run fresh, proportionate regression checks required by repository guidance and change risk.
- Report untested behavior or unavailable checks explicitly.
