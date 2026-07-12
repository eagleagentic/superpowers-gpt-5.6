#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPOSITORY_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
GUIDE="$REPOSITORY_ROOT/GUIDE.md"
README="$REPOSITORY_ROOT/README.md"
EXPECTED_SKILLS=13
MAX_USING_SUPERPOWERS_WORDS=200
MAX_IMPLEMENTATION_LOG_WORDS=180
MAX_SKILL_WORDS=350
MAX_TOTAL_WORDS=2700
MAX_DESCRIPTION_TOTAL_CHARS=2800
MAX_SUPPORT_WORDS=500
MAX_SUPPORT_TOTAL_WORDS=2200

shopt -s nullglob
skill_files=("$SCRIPT_DIR"/*/SKILL.md)

if [[ ! -f "$GUIDE" ]]; then
  echo "Missing GUIDE.md." >&2
  exit 1
fi

if [[ "${#skill_files[@]}" -ne "$EXPECTED_SKILLS" ]]; then
  echo "Expected exactly $EXPECTED_SKILLS SKILL.md files; found ${#skill_files[@]}." >&2
  exit 1
fi

failed=0
total=0
description_total=0
printf '%-52s %s\n' "SKILL" "WORDS"

for file in "${skill_files[@]}"; do
  read -r words _ < <(wc -w "$file")
  relative="${file#"$SCRIPT_DIR"/}"
  printf '%-52s %d\n' "$relative" "$words"
  total=$((total + words))

  description="$(sed -n 's/^description:[[:space:]]*//p' "$file")"
  if [[ -z "$description" ]]; then
    echo "$relative has no one-line description." >&2
    failed=1
  fi
  description_total=$((description_total + ${#description}))

  if [[ "$words" -gt "$MAX_SKILL_WORDS" ]]; then
    echo "$relative exceeds $MAX_SKILL_WORDS words." >&2
    failed=1
  fi
  if [[ "$relative" == "using-superpowers/SKILL.md" && "$words" -gt "$MAX_USING_SUPERPOWERS_WORDS" ]]; then
    echo "$relative exceeds $MAX_USING_SUPERPOWERS_WORDS words." >&2
    failed=1
  fi
  if [[ "$relative" == "writing-implementation-logs/SKILL.md" && "$words" -gt "$MAX_IMPLEMENTATION_LOG_WORDS" ]]; then
    echo "$relative exceeds $MAX_IMPLEMENTATION_LOG_WORDS words." >&2
    failed=1
  fi
done

printf '%-52s %d\n' "TOTAL" "$total"
if [[ "$total" -gt "$MAX_TOTAL_WORDS" ]]; then
  echo "Total exceeds $MAX_TOTAL_WORDS words." >&2
  failed=1
fi

printf '%-52s %d\n' "DESCRIPTION CHARS" "$description_total"
if [[ "$description_total" -gt "$MAX_DESCRIPTION_TOTAL_CHARS" ]]; then
  echo "Skill descriptions exceed $MAX_DESCRIPTION_TOTAL_CHARS characters." >&2
  failed=1
fi

support_total=0
printf '\n%-52s %s\n' "ON-DEMAND MARKDOWN" "WORDS"
while IFS= read -r file; do
  case "$(basename "$file")" in
    SKILL.md) continue ;;
  esac

  read -r words _ < <(wc -w "$file")
  relative="${file#"$SCRIPT_DIR"/}"
  printf '%-52s %d\n' "$relative" "$words"
  support_total=$((support_total + words))

  if [[ "$words" -gt "$MAX_SUPPORT_WORDS" ]]; then
    echo "$relative exceeds $MAX_SUPPORT_WORDS words." >&2
    failed=1
  fi
done < <(find "$SCRIPT_DIR" -type f -name '*.md' -print | sort)

printf '%-52s %d\n' "ON-DEMAND TOTAL" "$support_total"
if [[ "$support_total" -gt "$MAX_SUPPORT_TOTAL_WORDS" ]]; then
  echo "On-demand Markdown total exceeds $MAX_SUPPORT_TOTAL_WORDS words." >&2
  failed=1
fi

guide_link_count=0
while IFS= read -r link; do
  target="${link#](}"
  target="${target%)}"
  guide_link_count=$((guide_link_count + 1))

  if [[ ! -f "$REPOSITORY_ROOT/$target" ]]; then
    echo "GUIDE.md links to missing skill: $target" >&2
    failed=1
  fi
done < <(grep -Eo '\]\([^)]*/SKILL\.md\)' "$GUIDE" || true)

if [[ "$guide_link_count" -ne "${#skill_files[@]}" ]]; then
  echo "GUIDE.md lists $guide_link_count skills; found ${#skill_files[@]} SKILL.md files." >&2
  failed=1
fi

for file in "${skill_files[@]}"; do
  relative="${file#"$SCRIPT_DIR"/}"
  guide_target="skills/superpowers/$relative"
  if ! grep -Fq "]($guide_target)" "$GUIDE"; then
    echo "GUIDE.md does not list $relative." >&2
    failed=1
  fi
done

required_guide_strings=(
  'gpt-5.6-sol'
  'gpt-5.6-terra'
  'gpt-5.6-luna'
  'writing-implementation-logs'
  '/model'
  'https://developers.openai.com/api/docs/pricing'
  'https://developers.openai.com/api/docs/guides/latest-model'
  'https://developers.openai.com/api/docs/guides/prompt-caching'
  'https://learn.chatgpt.com/docs/models'
  'https://learn.chatgpt.com/docs/agent-configuration/subagents'
)

for required in "${required_guide_strings[@]}"; do
  if ! grep -Fq "$required" "$GUIDE"; then
    echo "GUIDE.md is missing required profile contract: $required" >&2
    failed=1
  fi
done

require_contract() {
  local file="$1"
  local expected="$2"

  if ! grep -Fq "$expected" "$file"; then
    echo "$(basename "$(dirname "$file")") is missing lifecycle contract: $expected" >&2
    failed=1
  fi
}

require_contract "$SCRIPT_DIR/using-superpowers/SKILL.md" 'A file edit or tool call alone never justifies escalation.'
require_contract "$SCRIPT_DIR/using-superpowers/SKILL.md" 'When planning helps routine work, native planning is sufficient; a native plan alone does not require a durable file.'
require_contract "$SCRIPT_DIR/using-superpowers/SKILL.md" 'Load another workflow skill only when its description independently matches the task'
require_contract "$SCRIPT_DIR/writing-plans/SKILL.md" 'A native plan alone does not require this file.'
require_contract "$SCRIPT_DIR/writing-plans/SKILL.md" 'A durable plan does not automatically require a log, review, worktree, or separate completion gate'
require_contract "$SCRIPT_DIR/writing-plans/SKILL.md" 'For destructive or external work, put recovery, stop conditions, and pre-execution checks in acceptance.'
require_contract "$SCRIPT_DIR/writing-plans/SKILL.md" 'YYYY-MM-DD-HHMMSS-01-plan-<slug>.md'
require_contract "$SCRIPT_DIR/writing-implementation-logs/SKILL.md" 'Do not create a log for ordinary changes or merely because a plan exists.'
require_contract "$SCRIPT_DIR/writing-implementation-logs/SKILL.md" 'A later same-scope implementation mutation requires affected re-verification'
require_contract "$SCRIPT_DIR/writing-implementation-logs/SKILL.md" 'YYYY-MM-DD-HHMMSS-02-log-<slug>.md'
require_contract "$SCRIPT_DIR/writing-implementation-logs/SKILL.md" 'YYYY-MM-DD-HHMMSS-01-log-<slug>.md'
require_contract "$SCRIPT_DIR/verification-before-completion/SKILL.md" 'Use ordinary scoped checks without this skill when a separate gate adds no discipline.'
require_contract "$SCRIPT_DIR/verification-before-completion/SKILL.md" 'For destructive operations, run a go/no-go check before execution and verify outcomes afterward.'
require_contract "$SCRIPT_DIR/finishing-a-development-branch/SKILL.md" 'Do not require a separate plan, log, or reconciliation artifact unless the user or repository does.'

if [[ -e "$SCRIPT_DIR/using-superpowers/references/durable-development.md" ]]; then
  echo "The retired universal lifecycle reference returned." >&2
  failed=1
fi

if grep -Eiq 'documentation readiness|Any Codex Plan Mode or native plan makes|after every fully implemented' "$SCRIPT_DIR"/*/SKILL.md; then
  echo "Found a retired universal lifecycle requirement." >&2
  failed=1
fi

for removed_skill in dispatching-parallel-agents subagent-driven-development; do
  if [[ -e "$SCRIPT_DIR/$removed_skill" ]]; then
    echo "Removed orchestration skill returned: $removed_skill" >&2
    failed=1
  fi
done

runtime_files=("$SCRIPT_DIR"/*/SKILL.md)
if grep -Eiq 'sub-?agents?|delegat(e|ed|es|ing|ion)|spawn_agent|followup_task|fork_turns' "${runtime_files[@]}"; then
  echo "Runtime Superpowers guidance must remain single-agent." >&2
  failed=1
fi

if grep -Eiq 'gpt-[0-9]|model_reasoning_effort' "$SCRIPT_DIR"/*/SKILL.md; then
  echo "Volatile model guidance belongs in GUIDE.md, not runtime skills." >&2
  failed=1
fi

if grep -Eiq 'GPT-5\.6[- ]Sol profile|GPT-5\.6-sol already handles|direct GPT-5\.6 Sol' "$README" "$SCRIPT_DIR/sync-skills.sh" "$SCRIPT_DIR"/*/SKILL.md; then
  echo "Found a stale GPT-5.6 Sol-only profile assumption." >&2
  failed=1
fi

printf '\nValidating local Markdown links\n'
for markdown_file in "$REPOSITORY_ROOT/GUIDE.md" "$REPOSITORY_ROOT/GUIDE.zh-TW.md" "$REPOSITORY_ROOT/README.md" "$REPOSITORY_ROOT/README.zh-TW.md"; do
  while IFS= read -r link; do
    target="${link#](}"
    target="${target%%#*}"
    case "$target" in
      ""|http://*|https://*|mailto:*) continue ;;
    esac

    if [[ ! -e "$(dirname "$markdown_file")/$target" ]]; then
      relative="${markdown_file#"$REPOSITORY_ROOT"/}"
      echo "$relative links to missing local target: $target" >&2
      failed=1
    fi
  done < <(grep -Eo '\]\([^)]+' "$markdown_file" || true)
done

while IFS= read -r markdown_file; do
  while IFS= read -r link; do
    target="${link#](}"
    target="${target%%#*}"
    case "$target" in
      ""|http://*|https://*|mailto:*) continue ;;
    esac

    if [[ ! -e "$(dirname "$markdown_file")/$target" ]]; then
      relative="${markdown_file#"$SCRIPT_DIR"/}"
      echo "$relative links to missing local target: $target" >&2
      failed=1
    fi
  done < <(grep -Eo '\]\([^)]+' "$markdown_file" || true)
done < <(find "$SCRIPT_DIR" -type f -name '*.md' -print | sort)

if [[ "$failed" -eq 0 ]]; then
  printf 'Inventory and local links OK: %d skills.\n' "${#skill_files[@]}"
fi

exit "$failed"
