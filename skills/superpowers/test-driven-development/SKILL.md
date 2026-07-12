---
name: test-driven-development
description: "Run test-first red-green-refactor through public behavior in thin vertical slices. Use only when the user requests TDD/test-first development or repository policy requires that workflow."
---

## Trigger

- Use this skill only when the user or repository requires test-first development.
- Use an existing failing test as the red state when it accurately captures the requirement.

## Skip

- Do not invoke this skill merely because code is testable; Codex can add proportionate behavior tests without imposing TDD.
- Skip test-first work for documentation, configuration-only changes, generated code, disposable prototypes, or behavior the available harness cannot exercise.
- Use a green-before-and-after check instead for behavior-preserving refactors.

## Core Loop

1. Define one thin vertical slice of observable behavior through its public boundary.
2. Before changing tests for persistent work, satisfy documentation readiness; test edits are implementation mutations.
3. Write or identify one focused test for that behavior.
4. Run it and confirm that it fails for the intended missing behavior, not a setup or syntax error.
5. Implement the smallest production change that can pass it.
6. Run the focused test and confirm it passes.
7. Refactor only when useful, keep the focused test green, and repeat. Synchronize material deviations before continuing.

## Escalation

- State why an automated test is impractical, then use the strongest available boundary, integration, compile, or manual check.
- Never delete or overwrite pre-existing or user-written code solely because test-first ordering was not followed.
- Mock only necessary boundaries; prefer observable behavior over implementation details.
- Read [testing-anti-patterns.md](testing-anti-patterns.md) only when adding mocks, doubles, or test-only production APIs.
- Stop and simplify the interface when test setup becomes disproportionate to the behavior.

## Evidence

- Retain the red failure reason and the green command result for each material behavior.
- After the final slice, run fresh, proportionate regression checks required by repository guidance and change risk.
- Reconcile after final verification; later relevant changes invalidate both.
- Report untested behavior or unavailable checks explicitly.
