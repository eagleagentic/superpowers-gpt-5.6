# Superpowers for GPT-5.6 Sol

<p align="center">
  <strong>A lean, adaptive Superpowers profile built specifically for Codex CLI.</strong>
</p>

<p align="center">
  <a href="README.zh-TW.md">繁體中文</a> ·
  <a href="GUIDE.md">English Guide</a> ·
  <a href="GUIDE.zh-TW.md">繁體中文指南</a> ·
  <a href="skills/superpowers">Browse Skills</a>
</p>

![GPT-5.6 Sol Superpowers dashboard showing 14 skills, 3,612 words, an 80.5 percent reduction, and the adaptive routing flow](assets/readme-dashboard.svg)

This repository is a Codex-native edition of [obra/superpowers](https://github.com/obra/superpowers/tree/main/skills), tailored for GPT-5.6 Sol.

## Install and quick start

This repository contains a bundle of 14 skills. Install each directory directly under [`skills/superpowers`](skills/superpowers) as a separate skill; the parent directory is not itself a skill.

### Install manually

The following setup works in macOS, Linux, WSL, and Git Bash. It keeps the clone outside the discovery directory, then symlinks each skill into the [Codex user skills directory](https://developers.openai.com/codex/skills):

```bash
set -eu

repo="$HOME/.agents/superpowers-gpt-5.6"
skills_dir="$HOME/.agents/skills"

git clone --depth 1 https://github.com/eagleagentic/superpowers-gpt-5.6.git "$repo"
mkdir -p "$skills_dir"

for skill in "$repo"/skills/superpowers/*; do
  [ -f "$skill/SKILL.md" ] || continue
  target="$skills_dir/$(basename "$skill")"
  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "Refusing to overwrite existing skill: $target" >&2
    exit 1
  fi
done

for skill in "$repo"/skills/superpowers/*; do
  [ -f "$skill/SKILL.md" ] || continue
  ln -s "$skill" "$skills_dir/$(basename "$skill")"
done
```

The preflight check stops before creating any skill links when a same-named installation already exists.

### Ask an AI to install it

Paste this into Codex:

```text
Use $skill-installer to install every direct child directory containing SKILL.md from
https://github.com/eagleagentic/superpowers-gpt-5.6/tree/main/skills/superpowers.
Install all 14 skills; do not install skills/superpowers as a single skill.
```

### Verify and update

Open `/skills` and confirm that the 14 skills appear, then invoke `$using-superpowers` in a new turn. Codex detects newly installed skills automatically; restart Codex if they do not appear.

For a manual installation, update the clone with:

```bash
git -C "$HOME/.agents/superpowers-gpt-5.6" pull --ff-only
```

The symlinks continue to point at the updated skill directories.

## Why this repository exists

Our team initially used obra/superpowers directly. In our day-to-day Codex CLI and GPT-5.6 Sol workflows, we observed noticeably slower iteration: mandatory skill activation, longer instructions, and fixed process chains added coordination latency and token overhead. This is an account of our practical experience in those workflows, not a general latency benchmark across every platform.

We created this tailored edition to keep the upstream engineering disciplines that improve outcomes while fitting the capabilities Codex already provides natively. Its instructions are compressed, and its adaptive routing loads process skills only when the task benefits from them instead of imposing unnecessary workflow. The resulting skill bodies contain **3,612 words versus 18,516 upstream—a reduction of 80.5%**.

> **The key difference:** `using-superpowers` still starts with every conversation, but it acts as a lightweight adaptive router—not a mandatory process chain.

## Why this edition

| Adaptive by default | Codex-native | Proportional rigor |
| :--- | :--- | :--- |
| Loads the smallest sufficient skill set for the task. | Uses native planning, subagents, approvals, and shared-workspace semantics. | Applies TDD, worktrees, review, and delegation when they materially improve the result. |

| Lean context | Lower coordination cost | Safer boundaries |
| :--- | :--- | :--- |
| Uses 3,612 words across 14 skill bodies—80.5% fewer than upstream. | Keeps straightforward work inline and delegates only substantial independent work. | Preserves user changes and requires authority for destructive or externally visible actions. |

## Compared with obra/superpowers

| Area | GPT-5.6 Sol edition | obra/superpowers |
| --- | --- | --- |
| Conversation startup | Always starts a lightweight skill router | Always checks and invokes applicable skills |
| Skill selection | Smallest sufficient set; no automatic process chain | Mandatory workflows and ordered skill transitions |
| Brainstorming | Used for ambiguous, high-impact choices | Required before every creative or behavior-changing task |
| Planning | Native planning for routine work; durable plans when a handoff is useful | Comprehensive plans with fine-grained steps and frequent commits |
| TDD | Used with testable behavior and a practical harness | Hard gate for nearly every feature, fix, and refactor |
| Subagents and review | Risk- and workload-driven | Fresh agents and staged reviews are central to the default workflow |
| Worktrees and delivery | Created only when isolation is requested or materially useful | Integrated into the standard implementation workflow |
| Verification | Fresh evidence proportional to the claim; avoids duplicate gates | Universal completion gate |
| Target environment | Codex CLI with GPT-5.6 Sol | Multiple agent harnesses |

The comparison is pinned to upstream commit [`d884ae0`](https://github.com/obra/superpowers/tree/d884ae04edebef577e82ff7c4e143debd0bbec99/skills). Counts were measured with `wc -w` across the 14 `SKILL.md` files on 2026-07-11: **3,612 words here versus 18,516 upstream**.

## Explore the skills

- Read the [English skill guide](GUIDE.md) or [Traditional Chinese guide](GUIDE.zh-TW.md).
- Browse the tailored bundle in [`skills/superpowers`](skills/superpowers).
- Review the always-on router in [`using-superpowers`](skills/superpowers/using-superpowers/SKILL.md).

Validate the context budget after changing the bundle:

```bash
bash skills/superpowers/check-context-budget.sh
```

The sync script protects this tailored profile and requires an explicit `--replace-tailored` flag before replacing it with upstream skills.

## Upstream credit

This project is adapted from Jesse Vincent's [obra/superpowers](https://github.com/obra/superpowers). The narrower Codex focus, adaptive routing policy, compressed instructions, and Codex-specific tooling are what make this edition a better fit for GPT-5.6 Sol.
