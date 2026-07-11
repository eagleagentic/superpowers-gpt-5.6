---
name: requesting-code-review
description: Obtain an evidence-based, read-only review of a defined code change. Use when the user requests review or when a risky cross-module, security, data, concurrency, migration, or public-contract change benefits from independent judgment before integration.
---

# Requesting Code Review

Review small or mechanical changes directly. Dispatch an independent reviewer only when the expected defect-detection value exceeds the handoff cost.

1. Define the exact change range from a recorded base, merge base, staged diff, or named files. Never assume `HEAD~1` covers the work.
2. Point to requirements or acceptance criteria instead of pasting broad session history.
3. Name specific risks when known and include existing verification evidence.
4. Dispatch [code-reviewer.md](code-reviewer.md) with `fork_turns: "none"` for self-contained context.
5. Validate every finding against the code and requirements before changing anything.

Keep the review read-only. Require actionable findings with file and line evidence, impact, and a concrete fix. Do not require strengths, generic recommendations, or a review after every task.

Fix supported Critical and Important findings before integration. Re-review only when a substantial correction changes the risk surface; otherwise run the relevant verification directly. Follow local repository instructions and command wrappers for all inspection commands.
