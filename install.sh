#!/usr/bin/env bash
# favskills — skill installer
# Usage: curl -fsSL https://raw.githubusercontent.com/hfayyaz101/favskills/main/install.sh | bash

set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/hfayyaz101/favskills/main"

# ── Colors (only when output is a tty) ───────────────────────────────────────
if [ -t 1 ]; then
  B=$'\033[1m'; G=$'\033[0;32m'; C=$'\033[0;36m'; R=$'\033[0m'
else
  B=''; G=''; C=''; R=''
fi

say() { printf "%s\n" "$*"; }
ok()  { say "${G}✓${R} $*"; }

# ── Skill catalog (bash 3 compatible — no associative arrays) ─────────────────
SKILL_IDS=(taste-skill web-design-guidelines image-to-code playwright)
SKILL_LABELS=(
  "Taste Skill            — professional website design pipeline"
  "Web Design Guidelines — Vercel UI/a11y review"
  "Image-to-Code         — visual reference → implementation"
  "Playwright CLI        — browser automation and testing"
)

# ── Installers ────────────────────────────────────────────────────────────────
install_claude() {
  local skill="$1"
  local dir="$HOME/.claude/skills/$skill"
  mkdir -p "$dir"
  curl -fsSL "$REPO_RAW/skills/$skill/SKILL.md" -o "$dir/SKILL.md"
  if [ "$skill" = "web-design-guidelines" ]; then
    mkdir -p "$dir/references"
    curl -fsSL "$REPO_RAW/skills/$skill/references/command.md" -o "$dir/references/command.md"
  fi
  ok "$skill  →  ~/.claude/skills/$skill/"
}

install_cursor() {
  local skill="$1" dir="$2"
  mkdir -p "$dir"
  curl -fsSL "$REPO_RAW/skills/$skill/SKILL.md" -o "$dir/$skill.mdc"
  ok "$skill  →  $dir/$skill.mdc"
}

# ── Menu helper ───────────────────────────────────────────────────────────────
# Writes prompt+options to stderr, reads answer from /dev/tty (works with pipe)
PICK=""
pick() {
  local prompt="$1"; shift
  say "" >&2
  say "${B}${prompt}${R}" >&2
  local i=1
  for opt in "$@"; do
    say "  $i) $opt" >&2
    i=$((i + 1))
  done
  printf "  > " >&2
  read -r PICK </dev/tty
}

# ── Main ──────────────────────────────────────────────────────────────────────
say ""
say "${B}╔══════════════════════════╗${R}"
say "${B}║   favskills  installer   ║${R}"
say "${B}╚══════════════════════════╝${R}"

# 1 — target agent
pick "Install for:" \
  "Claude Code" \
  "Cursor — global  (~/.cursor/rules/)" \
  "Cursor — project (.cursor/rules/)" \
  "Both   — Claude + Cursor global" \
  "Both   — Claude + Cursor project"
target="$PICK"

# 2 — which skills
pick "What to install:" \
  "Full suite  (all skills)" \
  "Frontend Design suite" \
  "Single skill"
suite="$PICK"

if [ "$suite" = "3" ]; then
  say "" >&2
  say "${B}Choose a skill:${R}" >&2
  i=1
  for label in "${SKILL_LABELS[@]}"; do
    say "  $i) $label" >&2
    i=$((i + 1))
  done
  printf "  > " >&2
  read -r num </dev/tty
  idx=$((num - 1))
  skills=("${SKILL_IDS[$idx]}")
else
  # suite 1 or 2 — same set right now (only one category)
  skills=("${SKILL_IDS[@]}")
fi

# 3 — install
say ""
say "${B}Installing...${R}"
for skill in "${skills[@]}"; do
  case "$target" in
    1) install_claude "$skill" ;;
    2) install_cursor "$skill" "$HOME/.cursor/rules" ;;
    3) install_cursor "$skill" ".cursor/rules" ;;
    4) install_claude "$skill"; install_cursor "$skill" "$HOME/.cursor/rules" ;;
    5) install_claude "$skill"; install_cursor "$skill" ".cursor/rules" ;;
    *) say "Invalid choice: $target"; exit 1 ;;
  esac
done

say ""
say "${G}${B}Done!${R}  Restart your agent to pick up new skills."
say ""
say "  ${C}One-liner:${R}"
say "  curl -fsSL https://raw.githubusercontent.com/hfayyaz101/favskills/main/install.sh | bash"
