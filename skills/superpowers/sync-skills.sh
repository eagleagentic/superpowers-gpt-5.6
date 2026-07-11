#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_URL="https://github.com/obra/superpowers.git"
SKILLS_PATH="skills"

WORK_DIR=""
COPIED_COUNT=0

cleanup() {
  if [[ -n "$WORK_DIR" && -d "$WORK_DIR" ]]; then
    echo "Removing temporary clone: $WORK_DIR/repo"
    rm -rf "$WORK_DIR"
  fi
}
trap cleanup EXIT

require_git() {
  if ! command -v git >/dev/null 2>&1; then
    echo "git is required to sync skills" >&2
    exit 1
  fi
}

clone_source() {
  WORK_DIR="$(mktemp -d "${TMPDIR:-/tmp}/sync-skills.XXXXXX")"
  git clone --depth 1 --filter=blob:none --sparse "$REPO_URL" "$WORK_DIR/repo" >/dev/null
  git -C "$WORK_DIR/repo" sparse-checkout set "$SKILLS_PATH" >/dev/null
}

copy_skill() {
  local skill="$1"
  local source_dir="$WORK_DIR/repo/$SKILLS_PATH/$skill"
  local target_dir="$SCRIPT_DIR/$skill"

  if [[ ! -d "$source_dir" ]]; then
    echo "Missing upstream skill: $skill" >&2
    exit 1
  fi

  rm -rf "$target_dir"
  mkdir -p "$target_dir"
  cp -R "$source_dir/." "$target_dir/"
  COPIED_COUNT=$((COPIED_COUNT + 1))
  echo "Copied $skill"
}

copy_all_skills() {
  local source_root="$WORK_DIR/repo/$SKILLS_PATH"
  local source_dir
  local skill

  if [[ ! -d "$source_root" ]]; then
    echo "Missing upstream skills path: $SKILLS_PATH" >&2
    exit 1
  fi

  for source_dir in "$source_root"/*; do
    [[ -d "$source_dir" ]] || continue
    skill="$(basename "$source_dir")"
    copy_skill "$skill"
  done
}

require_replace_tailored() {
  if [[ "$#" -eq 1 && "${1:-}" == "--replace-tailored" ]]; then
    return
  fi

  echo "Refusing to replace the tailored Codex CLI and GPT-5.6 Sol profile." >&2
  echo "Pass --replace-tailored to overwrite it with upstream skills." >&2
  exit 2
}

main() {
  require_replace_tailored "$@"
  require_git

  echo "Syncing Superpowers skills from $REPO_URL"
  clone_source
  copy_all_skills

  echo "Synced $COPIED_COUNT skills into $SCRIPT_DIR"
}

main "$@"
