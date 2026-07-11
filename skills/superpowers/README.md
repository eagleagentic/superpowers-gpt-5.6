# Codex Superpowers

Adapted from [obra/superpowers](https://github.com/obra/superpowers/tree/main/skills) as an adaptive, token-efficient profile for Codex CLI with GPT-5.6 Sol.

Start `using-superpowers` with every conversation, then load only the smallest skill set that directly matches the task and its risk. Do not apply a fixed skill chain, spawn agents by default, or repeat guidance that GPT-5.6 Sol already handles. User instructions, the nearest `AGENTS.md`, and Codex system capabilities remain authoritative.

Validate the context budget with:

```bash
bash skills/superpowers/check-context-budget.sh
```

`sync-skills.sh` protects this tailored profile and refuses upstream replacement unless `--replace-tailored` is passed explicitly.
