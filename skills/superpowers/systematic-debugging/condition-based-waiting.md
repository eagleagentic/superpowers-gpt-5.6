# Condition-Based Waiting

Replace guessed sleeps with polling for the observable condition that completes the operation. Keep a finite timeout so failures terminate with useful evidence.

## Apply the Pattern

1. Name the state, event, file, count, or value that proves readiness.
2. Read that state fresh on every poll.
3. Return the observed value when its predicate succeeds.
4. Poll at a moderate interval; avoid busy loops.
5. Fail after a bounded timeout with the condition name and last observed state.

```typescript
async function waitFor<T>(
  read: () => T,
  ready: (value: T) => boolean,
  description: string,
  timeoutMs = 5000,
  intervalMs = 20,
): Promise<T> {
  const deadline = Date.now() + timeoutMs;
  let value = read();

  while (!ready(value)) {
    if (Date.now() >= deadline) {
      throw new Error(`Timeout waiting for ${description}: ${String(value)}`);
    }
    await new Promise(resolve => setTimeout(resolve, intervalMs));
    value = read();
  }

  return value;
}

const result = await waitFor(getResult, value => value !== undefined, 'result');
```

## Keep Real Timing Tests Explicit

Use a fixed delay only when elapsed time is the behavior under test, such as debounce, throttle, retry backoff, or periodic output. First wait for the triggering condition, derive the delay from the specified timing, and document why that duration is required.

Do not replace a product timeout with unbounded waiting. Keep production timeout behavior separate from test synchronization.

## Evidence

Run the formerly flaky test repeatedly and under the relevant parallel or CI conditions. Report the polling condition, timeout, and any remaining timing dependency.
