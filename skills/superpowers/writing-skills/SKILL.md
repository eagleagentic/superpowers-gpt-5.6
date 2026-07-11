---
name: writing-skills
description: Maintains the Codex-focused Superpowers skill bundle. Use only when the user explicitly names writing-skills or asks to maintain the Superpowers skill bundle; use Codex's built-in skill-creator for general skill creation or editing.
---

# Maintaining Superpowers Skills

This is a compatibility layer for the tailored Codex CLI and GPT-5.6 Sol bundle. For ordinary skill authoring, stop here and use Codex's built-in `skill-creator`; it is the current source of truth for skill format and validation.

## Workflow

1. Read the nearest `AGENTS.md` and the built-in `skill-creator` completely.
2. Inspect only the target skill, its directly referenced resources, and relevant tests. Preserve unrelated work.
3. Keep YAML frontmatter to lowercase hyphenated `name` plus a `description` that states both capability and precise trigger. Match the folder name to `name`.
4. Keep `SKILL.md` procedural and concise. Assume GPT-5.6 Sol already understands general engineering practices.
5. Use progressive disclosure: put optional detail in `references/`, deterministic operations in `scripts/`, and output material in `assets/`. Link each resource only where it is needed.
6. Validate every changed skill:

   ```bash
   python3 "${CODEX_HOME:-$HOME/.codex}/skills/.system/skill-creator/scripts/quick_validate.py" "$SKILL_DIR"
   ```

7. For this bundle, also run `bash skills/superpowers/check-context-budget.sh` and relevant script syntax checks.
8. Forward-test only for trigger changes, high-risk mandatory behavior, or a demonstrated model failure. Start with one fresh independent task; expand only when evidence is ambiguous.
9. Report changed files, verification output, and any untested risk.
