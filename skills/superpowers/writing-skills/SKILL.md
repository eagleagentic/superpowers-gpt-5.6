---
name: writing-skills
description: Maintain the Codex-focused Superpowers bundle. Use only when the user names writing-skills or asks to maintain this bundle; use Codex's built-in skill-creator for general skill authoring.
---

# Maintaining Superpowers Skills

1. Read the nearest `AGENTS.md`, inspect the working tree, and audit each directly affected skill. For bundle-wide policy, compare every direct skill's description and body; load support resources only when activation or an intended edit depends on them.
2. Front-load one discriminative trigger per invocation branch in each description. Keep only non-obvious procedure in the body; make branch-only resources conditional and directly linked.
3. Remove duplication, stale prose, model-relative no-ops, and lifecycle rules owned elsewhere. Preserve authorization, user-work, security, and evidence guardrails.
4. Consult Codex's built-in `skill-creator` when creating structure, changing metadata format, or resolving a validation question; routine wording revisions do not need its full guide reloaded.
5. Validate every changed skill:

   ```bash
   python3 "${CODEX_HOME:-$HOME/.codex}/skills/.system/skill-creator/scripts/quick_validate.py" "$SKILL_DIR"
   ```

6. Run `bash skills/superpowers/check-context-budget.sh`, relevant script checks, and `git diff --check`.

Forward-test only when inspection and validators cannot establish activation or high-risk behavior. Use the smallest discriminating scenario and do not leak the expected answer. Report measured size, behavior changes, checks, and untested risk.
