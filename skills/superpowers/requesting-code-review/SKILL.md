---
name: requesting-code-review
description: Independently review a defined change before integration when requested or when material security, data, concurrency, migration, contract, or cross-module risk warrants it; exclude incoming feedback.
---

# Requesting Code Review

Do not use this workflow merely to evaluate incoming reviewer feedback.

1. Define the exact change range from a recorded base, merge base, staged diff, or named files. Never assume `HEAD~1` covers the work.
2. Read the requirements and name the specific risks under review.
3. Inspect the actual diff, affected callers, tests, contracts, and existing evidence only as far as those risks require.
4. Validate every finding against code and requirements.

Keep the review read-only. Report actionable findings by severity with file and line evidence, impact, and a concrete fix. Omit strengths, generic recommendations, and findings that do not change the decision.

Block integration on supported Critical and Important findings. Re-review only when a substantial correction changes the risk surface; otherwise run the affected verification directly.
