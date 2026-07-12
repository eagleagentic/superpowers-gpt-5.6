# Repository Guidelines

## Project Structure & Module Organization

This repository packages a Codex-oriented Superpowers skill bundle. Each installable skill is a direct child of `skills/superpowers/` and must contain a `SKILL.md`. Keep skill-specific helpers, prompts, and references inside that skill’s directory. Root-level `README.md` and `GUIDE.md` are the English product and skill indexes; `*.zh-TW.md` files are their Traditional Chinese counterparts. Dashboard artwork belongs in `assets/`.

## Build, Test, and Development Commands

This is documentation and shell-script based; there is no application build or package-manager workflow. Run the bundle validation after changing skills, guides, or their links:

```bash
bash skills/superpowers/check-context-budget.sh
```

The script verifies the skill inventory, word and metadata budgets, required lifecycle text, and local Markdown links. Use `bash skills/superpowers/sync-skills.sh --replace-tailored` only when intentionally replacing the tailored bundle with upstream skills; it is destructive to local skill content.

## Coding Style & Naming Conventions

Write concise Markdown with descriptive headings, active language, and fenced examples for commands. Preserve YAML front matter in every `SKILL.md`, including a short one-line `description`. Name skill directories in lowercase kebab-case (for example, `systematic-debugging`) and use uppercase `SKILL.md` for the skill entry point. Follow existing Bash conventions: `#!/usr/bin/env bash`, `set -euo pipefail`, uppercase constants, lowercase function names, and two-space indentation.

## Testing Guidelines

There is no separate unit-test suite. Treat `check-context-budget.sh` as the primary regression check and run it from the repository root. For documentation-only changes, also inspect `git diff --check` and verify that added Markdown links resolve locally. Keep validation changes focused on the modified skill or guide.

## Commit & Pull Request Guidelines

Recent history follows Conventional Commit-style subjects, such as `docs: add installation quick start`, `fix(assets): align Codex badge label`, and `chore: make bundle portable`. Use an imperative, scoped subject when useful. Keep each commit limited to one coherent change.

Pull requests should state the user-facing effect, list the validation command and result, and link related issues when applicable. Include before/after screenshots only for visual asset or rendered-guide changes. Do not mix unrelated skill updates, generated files, or formatting cleanup into the same PR.
