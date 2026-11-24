#!/usr/bin/env bash
# favskills — skill installer
# Usage: curl -fsSL https://raw.githubusercontent.com/hfayyaz101/favskills/main/install.sh | bash

set -euo pipefail

REPO_RAW="https://raw.githubusercontent.com/hfayyaz101/favskills/main"

# ── Colors (only when output is a tty) ───────────────────────────────────────
if [ -t 1 ]; then
  B=$'\033[1m'; G=$'\033[0;32m'; C=$'\033[0;36m'; Y=$'\033[0;33m'; R=$'\033[0m'
else
  B=''; G=''; C=''; Y=''; R=''
fi

say() { printf "%s\n" "$*"; }
ok()  { say "${G}✓${R} $*"; }
tip() { say "${Y}→${R} $*"; }

# ── Skill catalog ─────────────────────────────────────────────────────────────
# Skills with a local SKILL.md — auto-installable via curl
AUTO_SKILLS=(
  taste-skill
  web-design-guidelines
  image-to-code
  playwright
  uiux-pro-max
  archify
  impeccable
  ppt-master
  diagram-design
  karpathy-skills
  last30days
  humanizer
  i-have-adhd
  wifi-diagnostics
  wifi-diagnostics-pro
)

# Skills by category (AUTO only — complex installs handled separately)
CAT_FRONTEND=(taste-skill web-design-guidelines image-to-code playwright uiux-pro-max archify impeccable ppt-master diagram-design)
CAT_SENIOR=(karpathy-skills)
CAT_RESEARCH=(last30days)
CAT_LARGE=()
CAT_WRITING=(humanizer i-have-adhd)
CAT_NETWORKING=(wifi-diagnostics wifi-diagnostics-pro)

LABEL_taste-skill="Taste Skill              — professional website design pipeline"
LABEL_web-design-guidelines="Web Design Guidelines   — Vercel UI/a11y review"
LABEL_image-to-code="Image-to-Code           — visual reference → implementation"
LABEL_playwright="Playwright CLI          — browser automation and testing"
LABEL_uiux-pro-max="UI UX Pro Max           — 194 design rules, 80 UI styles"
LABEL_archify="Archify                 — anything → interactive visual diagram"
LABEL_impeccable="Impeccable              — 24 design vocab commands, 62 slop rules"
LABEL_ppt-master="PPT Master              — native .pptx from any source document"
LABEL_diagram-design="Diagram Design          — 52 diagram types as branded HTML+SVG"
LABEL_karpathy-skills="Karpathy Guidelines     — think before coding, simplicity, surgical edits"
LABEL_last30days="Last 30 Days            — real-engagement search across Reddit/X/YouTube/HN"
LABEL_humanizer="Humanizer               — rewrites AI text to sound human (26 patterns)"
LABEL_i-have-adhd="I Have ADHD             — action-first outputs, numbered steps, no filler"
LABEL_wifi-diagnostics="Wi-Fi Diagnostics       — 4-step audit: RF/PHY, latency, DNS, throughput + ranked fixes"
LABEL_wifi-diagnostics-pro="Wi-Fi Diagnostics Pro   — adds Wi-Fi 6E/7, MIMO, WPA3, mesh, MTU, bufferbloat grade"

# ── Auto-installer ────────────────────────────────────────────────────────────
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

install_skill() {
  local target="$1" skill="$2"
  case "$target" in
    1) install_claude "$skill" ;;
    2) install_cursor "$skill" "$HOME/.cursor/rules" ;;
    3) install_cursor "$skill" ".cursor/rules" ;;
    4) install_claude "$skill"; install_cursor "$skill" "$HOME/.cursor/rules" ;;
    5) install_claude "$skill"; install_cursor "$skill" ".cursor/rules" ;;
  esac
}

# ── Complex install hints (can't automate) ────────────────────────────────────
print_manual_installs() {
  local category="$1"
  case "$category" in
    frontend)
      say ""
      say "${B}Also in Frontend (manual install):${R}"
      tip "Awesome Design MD   pick a DESIGN.md at https://getdesign.md, copy to project root"
      ;;
    senior)
      say ""
      say "${B}Also in Senior Dev (manual install):${R}"
      tip "ECC (72 agents)      npx ecc-universal@2.2.3 setup"
      tip "Agent Skills (Vercel) npx skills add https://github.com/vercel-labs/agent-skills --skill 'react-best-practices'"
      tip "Superpowers          /plugin marketplace add anthropics-official/superpowers  (run in Claude Code)"
      tip "Ponytail             /plugin marketplace add <ponytail-repo>  (run in Claude Code)"
      ;;
    research)
      say ""
      say "${B}Also in Research (manual install):${R}"
      tip "Graphify             uv tool install graphifyy"
      tip "Agent Reach          see https://github.com/Panniantong/agent-reach"
      tip "Understand Anything  /plugin marketplace add Egonex-AI/Understand-Anything  (run in Claude Code)"
      tip "Career Ops           /plugin marketplace add career-ops-hq/career-ops  (run in Claude Code)"
      tip "REA                  npx rea-agents setup"
      ;;
    large)
      say ""
      say "${B}Large Projects & Token Management (all manual):${R}"
      tip "GStack               git clone https://github.com/garrytan/gstack ~/.claude/skills/gstack && cd ~/.claude/skills/gstack && ./setup"
      tip "Caveman              npx skills add https://github.com/juliusbrussee/caveman --skill caveman"
      tip "Claude-Mem           npx @thedotmack/claude-mem@latest"
      tip "Headroom             npm install -g headroom-ai-cli && headroom wrap claude"
      tip "GSD Core             npx @opengsd/gsd-core@latest"
      tip "BMad Method          npx skills add bmad-code-org/BMAD-METHOD/skills/method --skill '*'"
      ;;
    writing)
      say ""
      say "${B}Also in Writing & Video (manual install):${R}"
      tip "Generative Media     npx skills add https://github.com/calesthio/generative-media-skills --skill '*'"
      tip "Hyperframes          /plugin marketplace add heygen-com/hyperframes  (run in Claude Code)"
      tip "Marketing Skills     npx skills add https://github.com/coreyhaines31/marketingskills --skill '*'"
      ;;
    networking)
      ;;
  esac
}

# ── Menu helper ───────────────────────────────────────────────────────────────
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

# 2 — category
pick "Category:" \
  "All skills (auto-installable)" \
  "Frontend Design  (9 skills)" \
  "Senior Developer (1 auto + hints for 5 more)" \
  "Research & Understanding (1 auto + hints for 5 more)" \
  "Large Projects & Token Management (hints only)" \
  "Writing & Video  (2 auto + hints for 3 more)" \
  "Networking & System (2 skills)" \
  "Single skill"
category="$PICK"

case "$category" in
  1) skills=("${AUTO_SKILLS[@]}"); cat_key="all" ;;
  2) skills=("${CAT_FRONTEND[@]}"); cat_key="frontend" ;;
  3) skills=("${CAT_SENIOR[@]}"); cat_key="senior" ;;
  4) skills=("${CAT_RESEARCH[@]}"); cat_key="research" ;;
  5) skills=(); cat_key="large" ;;
  6) skills=("${CAT_WRITING[@]}"); cat_key="writing" ;;
  7) skills=("${CAT_NETWORKING[@]}"); cat_key="networking" ;;
  8)
    say "" >&2
    say "${B}Choose a skill:${R}" >&2
    i=1
    for s in "${AUTO_SKILLS[@]}"; do
      label_var="LABEL_${s//-/_}"
      # bash 3: indirect variable reference
      eval "label=\${LABEL_${s//-/_}:-$s}"
      say "  $i) $label" >&2
      i=$((i + 1))
    done
    printf "  > " >&2
    read -r num </dev/tty
    idx=$((num - 1))
    skills=("${AUTO_SKILLS[$idx]}")
    cat_key="single"
    ;;
  *) say "Invalid choice."; exit 1 ;;
esac

# 3 — install
if [ "${#skills[@]}" -gt 0 ]; then
  say ""
  say "${B}Installing...${R}"
  for skill in "${skills[@]}"; do
    install_skill "$target" "$skill"
  done
fi

# 4 — print manual hints for the category
if [ "$cat_key" != "single" ] && [ "$cat_key" != "all" ]; then
  print_manual_installs "$cat_key"
elif [ "$cat_key" = "all" ]; then
  print_manual_installs "frontend"
  print_manual_installs "senior"
  print_manual_installs "research"
  print_manual_installs "large"
  print_manual_installs "writing"
  print_manual_installs "networking"
fi

say ""
say "${G}${B}Done!${R}  Restart your agent to pick up new skills."
say ""
say "  ${C}Docs:${R}      https://github.com/hfayyaz101/favskills"
say "  ${C}One-liner:${R} curl -fsSL https://raw.githubusercontent.com/hfayyaz101/favskills/main/install.sh | bash"
