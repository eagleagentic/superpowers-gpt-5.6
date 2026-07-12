#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPOSITORY_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
GUIDE="$REPOSITORY_ROOT/GUIDE.md"
README="$REPOSITORY_ROOT/README.md"
EXPECTED_SKILLS=13
MAX_USING_SUPERPOWERS_WORDS=200
MAX_IMPLEMENTATION_LOG_WORDS=180
MAX_SKILL_WORDS=500
MAX_TOTAL_WORDS=3500
MAX_DESCRIPTION_TOTAL_CHARS=3000
MAX_SUPPORT_WORDS=700
MAX_SUPPORT_TOTAL_WORDS=3200

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

require_contract "$SCRIPT_DIR/using-superpowers/SKILL.md" 'Any Codex Plan Mode or native plan makes a durable task file mandatory.'
require_contract "$SCRIPT_DIR/using-superpowers/SKILL.md" '**Simple implementation:** low-risk, reversible, one direct path.'
require_contract "$SCRIPT_DIR/writing-plans/SKILL.md" 'Once any plan exists, however, never downgrade the durable requirement.'
require_contract "$SCRIPT_DIR/writing-implementation-logs/SKILL.md" 'Write only after the whole implementation and primary verification finish.'
require_contract "$SCRIPT_DIR/writing-implementation-logs/SKILL.md" 'A later same-scope implementation mutation invalidates the log'
require_contract "$SCRIPT_DIR/using-superpowers/references/durable-development.md" 'Conversation-only, read-only, plan-only, blocked, and no-diff work do not receive an Implementation Log.'

for removed_skill in dispatching-parallel-agents subagent-driven-development; do
  if [[ -e "$SCRIPT_DIR/$removed_skill" ]]; then
    echo "Removed orchestration skill returned: $removed_skill" >&2
    failed=1
  fi
done

runtime_files=("$SCRIPT_DIR"/*/SKILL.md "$SCRIPT_DIR/using-superpowers/references/durable-development.md")
if grep -Eiq 'sub-?agents?|delegat(e|ed|es|ing|ion)|spawn_agent|followup_task|fork_turns' "${runtime_files[@]}"; then
  echo "Runtime Superpowers guidance must not own delegation; use native Codex instead." >&2
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

validate_local_links() {
  local markdown_file="$1"
  local link
  local target
  local relative

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
}

printf '\nValidating local Markdown links\n'
for markdown_file in "$REPOSITORY_ROOT/GUIDE.md" "$REPOSITORY_ROOT/GUIDE.zh-TW.md" "$REPOSITORY_ROOT/README.md" "$REPOSITORY_ROOT/README.zh-TW.md"; do
  validate_local_links "$markdown_file"
done

while IFS= read -r markdown_file; do
  validate_local_links "$markdown_file"
done < <(find "$SCRIPT_DIR" -type f -name '*.md' -print | sort)

if [[ "$failed" -eq 0 ]]; then
  printf 'Inventory and local links OK: %d skills.\n' "${#skill_files[@]}"
fi

exit "$failed"
