# Testing Anti-Patterns

Test observable production behavior. Use mocks and doubles only to control a necessary boundary, not as the subject of the test.

## Test Real Behavior

- Assert public outputs, state, errors, or durable side effects.
- Avoid assertions that merely prove a mock component exists or a stub returns its configured value.
- Assert calls only when the interaction itself is a contract, such as sending one message or withholding a destructive operation.

```typescript
test('rejects a duplicate server', async () => {
  const store = new InMemoryConfigStore();
  const transport = { start: vi.fn() }; // isolate only the external boundary
  const service = new ServerService(store, transport);

  await service.add({ id: 'docs' });

  await expect(service.add({ id: 'docs' })).rejects.toThrow('duplicate');
  expect(await store.has('docs')).toBe(true);
});
```

Keep the state transition real; replace only the external startup.

## Mock Deliberately

1. Identify the real dependency's outputs, side effects, errors, and ordering.
2. Run with the real or in-memory implementation first when those behaviors are unclear.
3. Mock the narrowest slow, external, destructive, or nondeterministic boundary.
4. Preserve every behavior the test relies on; do not mock the higher-level operation under test.
5. Prefer a small fake over a chain of interaction mocks when stateful behavior matters.

## Keep Test-Only APIs Out of Production

- Do not add a production method used only for setup, inspection, or cleanup in tests.
- Put test orchestration in fixtures, builders, or test utilities.
- Keep a lifecycle method in production only when the production object genuinely owns that lifecycle and real callers need it.
- Expose behavior through the public contract; do not weaken visibility solely for tests.

## Build Faithful Doubles

- Make doubles satisfy the real interface or schema at compile time when possible.
- Include all required fields, nested values, side effects, and failure modes consumed along the exercised path.
- Centralize representative objects in typed factories instead of hand-writing partial objects per test.
- Add a contract test when multiple implementations or API-backed fixtures must remain interchangeable.
- Fail loudly on unsupported calls; do not return permissive `undefined` values that hide missing behavior.

## Escalate to Real Components

Replace complex mocks with real in-memory components or a focused integration test when setup exceeds the assertion, mocks mirror implementation details, or cross-component behavior is the requirement.

## Evidence

Observe the test fail for the intended behavior, then pass after the production change. Run the relevant contract or integration check when a double represents an external schema or stateful dependency.
