# Reconcile GPT-5.6 Family Superpowers Bundle

## Plan

**Goal:** Make the lifecycle update, native-delegation boundary, validation, public documentation, and dashboard metadata internally consistent.
**Why planning is required:** This is a bundle-wide policy change spanning installable skills, support scripts, bilingual public documentation, generated-style assets, and completion records.
**Acceptance:** The repository exposes exactly 13 valid skills; public indexes and metrics match that inventory; documentation explains that Codex Ultra owns native subagent delegation; and the repository validation passes without references to absent artifacts or deleted bundle workflows.

### Outcome 1: Validate the repository's actual bundle contract
- Work: Make `check-context-budget.sh` resolve root documentation correctly, enforce the final inventory and lifecycle contracts, and remove checks for artifacts this standalone repository does not own.
- Verify: `bash skills/superpowers/check-context-budget.sh`

### Outcome 2: Publish the GPT-5.6 family profile
- Work: Synchronize English and Traditional Chinese guides, READMEs, and dashboard SVGs with the 13-skill inventory, computed metrics, new implementation-log skill, GPT-5.6 family guidance, and the boundary that Codex Ultra provides native delegation rather than bundle-owned dispatch workflows. Remove the legacy `docs/changes` record in favor of the durable plan and matching Implementation Log.
- Verify: local-link inspection plus final inventory and metric checks.

### Outcome 3: Validate the skill and shell support surface
- Work: Preserve the lifecycle and shell-hardening changes, confirm no deleted delegation resources are referenced, and keep the new skill metadata valid.
- Verify: `quick_validate.py` for every skill, `bash -n` for modified shell scripts, focused argument-path smoke tests, and `git diff --check`.

### Outcome 4: Record the verified implementation
- Work: Create a matching Implementation Log after primary verification and reconcile it with the actual diff and acceptance criteria.
- Verify: reopen this plan and the matching log before commit and push.
