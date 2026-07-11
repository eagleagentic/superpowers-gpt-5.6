# Risk-Based Boundary Validation

Add validation at boundaries that own an invariant or protect a meaningful risk. Do not duplicate every check at every layer.

## Choose Boundaries

1. Define the invalid state and its consequence.
2. Put the primary validation where the invariant is authoritatively owned.
3. Validate untrusted shape and syntax at the external entry boundary.
4. Add a secondary guard only when another path can bypass the owner, the operation is destructive or security-sensitive, or independently deployed components require their own contract.
5. Reuse one validator or error contract where possible to prevent inconsistent rules.
6. Prefer observability over another rejection layer when the remaining risk is diagnostic rather than preventive.

## Example

Treat a workspace directory as a service invariant:

```typescript
function requireWorkspaceDir(input: string): string {
  if (!input.trim()) throw new Error('workspace directory is required');
  return resolve(input);
}

function createWorkspace(input: string) {
  const directory = requireWorkspaceDir(input); // authoritative check
  return gitInit(directory);
}
```

Add a second guard inside `gitInit` only if callers can invoke it directly or an incorrect path could damage user data. Keep an API controller check limited to request shape; do not copy filesystem policy into it.

## Verify

- Test the authoritative validator with valid, boundary, and invalid inputs.
- Test each added guard through the bypass path it protects.
- Preserve structured, consistent errors across boundaries.
- Confirm that valid callers remain unaffected.
- Remove redundant checks that add no distinct protection or evidence.
