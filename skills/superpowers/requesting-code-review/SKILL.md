---
name: requesting-code-review
description: Review a defined code change with evidence-based, read-only analysis. Use when the user requests review or when a risky cross-module, security, data, concurrency, migration, or public-contract change needs focused judgment before integration.
---

# Requesting Code Review

Keep small or mechanical reviews focused. Broaden inspection only when the named risk or changed contract requires it.

1. Define the exact change range from a recorded base, merge base, staged diff, or named files. Never assume `HEAD~1` covers the work.
2. For persistent work, inspect the canonical record; standalone read-only reviews need only requirements. Ignore broad session history that does not affect acceptance.
3. Name specific risks when known and inspect existing verification evidence.
4. Inspect the actual diff, relevant callers, tests, and contracts only as far as needed to evaluate requirements and named risks.
5. Validate every finding against the code and requirements before changing anything.

Keep the review read-only. Persistent-work reviews compare the actual diff with canonical acceptance and flag stale claims. Require actionable findings with file and line evidence, impact, and a concrete fix. Do not require strengths, generic recommendations, or a review after every task.

Fix supported Critical and Important findings before integration. Re-review only when a substantial correction changes the risk surface; otherwise run the relevant verification directly. Follow local repository instructions and command wrappers for all inspection commands.
