---
name: requesting-code-review
description: Review a defined change with evidence-based, read-only analysis. Use when requested or when material security, data, concurrency, migration, public-contract, or cross-module risk warrants judgment before integration; skip routine changes.
---

# Requesting Code Review

1. Define the exact change range from a recorded base, merge base, staged diff, or named files. Never assume `HEAD~1` covers the work.
2. Read the requirements and name the specific risks under review.
3. Inspect the actual diff, affected callers, tests, contracts, and existing evidence only as far as those risks require.
4. Validate every finding against code and requirements.

Keep the review read-only. Report actionable findings by severity with file and line evidence, impact, and a concrete fix. Omit strengths, generic recommendations, and findings that do not change the decision.

Block integration on supported Critical and Important findings. Re-review only when a substantial correction changes the risk surface; otherwise run the affected verification directly.
