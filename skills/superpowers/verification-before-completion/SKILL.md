---
name: verification-before-completion
description: "Use an explicit claim-to-evidence gate for High-risk work, disputed or unreliable claims, or multiple independent material claims; routine command sets alone do not trigger it."
---

# Verification Gate

Router-, user-, or repository-required gates cannot be skipped. Otherwise use ordinary scoped checks when a separate gate adds no discipline. Multiple routine commands alone do not trigger this skill.

Reuse fresh evidence from active workflows instead of rerunning commands; map it to the claims it proves.

For destructive operations, run a go/no-go check before execution and verify outcomes afterward.

For production deployment, verify the target and revision, rollout health, rollback readiness, and runtime evidence; a Git push is not deployment evidence. For production-data changes, verify target identity, dry-run scope, recovery readiness, integrity, and post-operation counts without exposing sensitive records.

1. List each material claim and the command or inspection that proves it.
2. After the final relevant change, run the narrowest sufficient checks, batching compatible checks.
3. Inspect exit status, failures, and meaningful warnings; do not infer success from partial output.
4. Compare the actual diff and final state with acceptance.
5. Report only what the evidence proves, including unavailable or failing checks.

Any later relevant mutation invalidates affected evidence only; rerun the corresponding checks.

Broaden checks only when repository policy or the named risk requires it. Preserve user work and distinguish verified outcomes from assumptions or pre-existing failures.
