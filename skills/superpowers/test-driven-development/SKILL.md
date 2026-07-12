---
name: test-driven-development
description: "Run test-first red-green-refactor through public behavior in thin vertical slices. Use only when the user requests TDD/test-first development or repository policy requires that workflow."
---

# Test-Driven Development

Do not trigger merely because code is testable. Skip documentation, configuration-only changes, generated code, disposable prototypes, behavior the harness cannot exercise, and behavior-preserving refactors; use a green-before-and-after check for the last case.

1. Define one thin vertical slice of observable behavior through its public boundary.
2. Write or identify one focused test; an existing accurate failure can be the red state.
3. Run it and confirm it fails for the intended missing behavior, not setup or syntax.
4. Implement the smallest production change that passes it.
5. Run the focused test, refactor only when useful, keep it green, and repeat.

Test public outputs, state, errors, or durable effects. Mock only necessary boundaries. Read [testing-anti-patterns.md](testing-anti-patterns.md) only when adding mocks, doubles, or test-only production APIs.

If automated coverage is impractical, state why and use the strongest boundary, integration, compile, or manual check. Preserve pre-existing user code. Retain the red reason, green result, final proportionate regression result, and any untested behavior.
