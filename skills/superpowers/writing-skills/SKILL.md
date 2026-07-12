---
name: writing-skills
description: Maintain the Codex-focused Superpowers bundle. Use only when the user names writing-skills or asks to maintain this bundle; use Codex's built-in skill-creator for general skill authoring.
---

# Maintaining Superpowers Skills

Use Codex's built-in `skill-creator` as the source of truth for format and validation.

## Workflow

1. Read the nearest `AGENTS.md` and the built-in `skill-creator` completely.
2. Inspect the target and direct resources. For bundle-wide policy changes, audit every skill and support resource before choosing edits. Preserve unrelated work.
3. In each description, front-load a discriminative leading phrase and keep one trigger per independent invocation branch. Delete synonymous triggers and body summaries.
4. Keep only non-obvious procedure in `SKILL.md`. Inline material every branch needs; disclose branch-only detail through a precise pointer to `references/`, `scripts/`, or `assets/`.
5. Delete duplication, stale sediment, and model-relative no-ops. Keep runtime guidance family-neutral; put volatile model, pricing, and caching facts in the GUIDE with official links. Retain only behavior or necessary guardrails.
6. Validate every changed skill:

   ```bash
   python3 "${CODEX_HOME:-$HOME/.codex}/skills/.system/skill-creator/scripts/quick_validate.py" "$SKILL_DIR"
   ```

7. For this bundle, also run `bash skills/superpowers/check-context-budget.sh` and relevant script syntax checks.
8. Forward-test trigger changes and high-risk behavior in fresh independent sessions. Start with a discriminating case; expand only when evidence is ambiguous, and revert wording that changes no observable behavior.
9. Report changed files, verification output, and any untested risk.
