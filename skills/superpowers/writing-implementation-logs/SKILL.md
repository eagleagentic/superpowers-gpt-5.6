---
name: writing-implementation-logs
description: Write one concise human-readable log after every fully implemented and freshly verified persistent change. Use once before completion, commit, or push; skip read-only, plan-only, blocked, no-diff, or integration-only turns.
---

# Writing Implementation Logs

Write only after the whole implementation and primary verification finish.

1. Inspect matching files in `./superpowers/docs/plans/` and `./superpowers/docs/logs/`; create or replace `./superpowers/docs/logs/YYYY-MM-DD-<slug>.md`, matching its plan filename.
2. Inspect the actual diff and fresh evidence.
3. Append or replace:

```markdown
## Implementation Log

**Completed:** <date>

### What changed
- <one to three plain-language bullets>

### Verification
- <one to three concise results>

### Notes
- <only material limitation; omit when empty>
```

Match the repository's language. Omit transcripts, hidden reasoning, routine output, exhaustive lists, and diff narration.

Run affected documentation and diff checks, then reconcile. A later same-scope implementation mutation invalidates the log; after re-verification update it instead of appending. The log never triggers another log.
