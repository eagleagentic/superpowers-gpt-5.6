#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EXPECTED_SKILLS=14
MAX_USING_SUPERPOWERS_WORDS=200
MAX_SKILL_WORDS=500
MAX_TOTAL_WORDS=6000
MAX_SUPPORT_WORDS=700
MAX_SUPPORT_TOTAL_WORDS=4000

shopt -s nullglob
skill_files=("$SCRIPT_DIR"/*/SKILL.md)

if [[ "${#skill_files[@]}" -ne "$EXPECTED_SKILLS" ]]; then
  echo "Expected exactly $EXPECTED_SKILLS SKILL.md files; found ${#skill_files[@]}." >&2
  exit 1
fi

failed=0
total=0
printf '%-52s %s\n' "SKILL" "WORDS"

for file in "${skill_files[@]}"; do
  read -r words _ < <(wc -w "$file")
  relative="${file#"$SCRIPT_DIR"/}"
  printf '%-52s %d\n' "$relative" "$words"
  total=$((total + words))

  if [[ "$words" -gt "$MAX_SKILL_WORDS" ]]; then
    echo "$relative exceeds $MAX_SKILL_WORDS words." >&2
    failed=1
  fi
  if [[ "$relative" == "using-superpowers/SKILL.md" && "$words" -gt "$MAX_USING_SUPERPOWERS_WORDS" ]]; then
    echo "$relative exceeds $MAX_USING_SUPERPOWERS_WORDS words." >&2
    failed=1
  fi
done

printf '%-52s %d\n' "TOTAL" "$total"
if [[ "$total" -gt "$MAX_TOTAL_WORDS" ]]; then
  echo "Total exceeds $MAX_TOTAL_WORDS words." >&2
  failed=1
fi

support_total=0
printf '\n%-52s %s\n' "ON-DEMAND MARKDOWN" "WORDS"
while IFS= read -r file; do
  case "$(basename "$file")" in
    SKILL.md|GUIDE.md|README.md) continue ;;
  esac

  read -r words _ < <(wc -w "$file")
  relative="${file#"$SCRIPT_DIR"/}"
  printf '%-52s %d\n' "$relative" "$words"
  support_total=$((support_total + words))

  if [[ "$words" -gt "$MAX_SUPPORT_WORDS" ]]; then
    echo "$relative exceeds $MAX_SUPPORT_WORDS words." >&2
    failed=1
  fi
done < <(find "$SCRIPT_DIR" -type f -name '*.md' -print)

printf '%-52s %d\n' "ON-DEMAND TOTAL" "$support_total"
if [[ "$support_total" -gt "$MAX_SUPPORT_TOTAL_WORDS" ]]; then
  echo "On-demand Markdown total exceeds $MAX_SUPPORT_TOTAL_WORDS words." >&2
  failed=1
fi

exit "$failed"
