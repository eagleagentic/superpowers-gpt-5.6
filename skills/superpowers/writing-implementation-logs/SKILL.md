---
name: writing-implementation-logs
description: Write a concise durable record when required or consequential irreversible work needs audit/recovery; skip ordinary changes and handoffs.
---

# Writing Implementation Logs

Skip ordinary changes and plan-only triggers. Write after implementation and primary verification.

Do not include secrets or sensitive record identifiers.
This file never replaces an operational system-of-record audit.

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
