---
name: verification-before-completion
description: "Build an explicit claim-to-evidence gate for high-risk, disputed, multi-check, or previously unreliable completion claims; skip when ordinary scoped checks or an active workflow already prove the result."
---

# Verification Gate

Use ordinary scoped checks without this skill when a separate gate adds no discipline. Do not duplicate an active workflow's verification.

For destructive operations, run a go/no-go check before execution and verify outcomes afterward.

1. List each material claim and the command or inspection that proves it.
2. After the final relevant change, run the narrowest sufficient checks, batching compatible checks.
3. Inspect exit status, failures, and meaningful warnings; do not infer success from partial output.
4. Compare the actual diff and final state with acceptance.
5. Report only what the evidence proves, including unavailable or failing checks.

Any later relevant mutation invalidates affected evidence only; rerun the corresponding checks.

Broaden checks only when repository policy or the named risk requires it. Preserve user work and distinguish verified outcomes from assumptions or pre-existing failures.
