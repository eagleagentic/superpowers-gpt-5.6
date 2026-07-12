---
name: test-driven-development
description: "Use test-first red-green-refactor for authorized work when requested or required, or when a cheap focused red test disambiguates implementation or captures a confirmed regression."
---

# Test-Driven Development

The user need not know or request TDD, but loading this skill does not authorize implementation. Expected behavior must be clear. Auto-trigger only when a cheap focused red test distinguishes plausible implementations or captures a confirmed regression at a public boundary. A test being possible or useful later is not enough.

For an unclear cause, `systematic-debugging` owns investigation; enter red-green only after the expected behavior and red signal are trustworthy. Skip documentation, configuration-only changes, generated code, prototypes, untestable behavior, and behavior-preserving refactors; check the last green before and after.

1. Define one thin vertical slice of observable behavior through its public boundary.
2. Write or identify one focused test; an existing accurate failure can be the red state.
3. Run it and confirm it fails for the intended missing behavior, not setup or syntax.
4. Implement the smallest production change that passes it.
5. Run the focused test, refactor only when useful, keep it green, and repeat.

Test public outputs, state, errors, or durable effects. Mock only necessary boundaries. Read [testing-anti-patterns.md](testing-anti-patterns.md) only when adding mocks, doubles, or test-only production APIs.

If automated coverage is impractical, state why and use the strongest boundary, integration, compile, or manual check. Preserve pre-existing user code. Retain the red reason, green result, final proportionate regression result, and any untested behavior.
