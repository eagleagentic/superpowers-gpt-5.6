---
name: writing-implementation-logs
description: Write a concise durable implementation record when the user or repository requires one, or complex long-running work needs audit or recovery; skip ordinary changes and routine handoffs.
---

# Writing Implementation Logs

Do not create a log for ordinary changes or merely because a plan exists. Write only after the implementation and primary verification finish.

1. Inspect the actual diff, fresh evidence, and any same-scope plan.
2. For planned work, create or replace `./superpowers/docs/logs/YYYY-MM-DD-HHMMSS-02-log-<slug>.md` with the plan's timestamp and slug. For a standalone required record, use `./superpowers/docs/logs/YYYY-MM-DD-HHMMSS-01-log-<slug>.md`.
3. Record only:

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

After writing the log, rerun only checks whose inputs changed. A later same-scope implementation mutation requires affected re-verification and an update to the same log; the log never triggers another log.
