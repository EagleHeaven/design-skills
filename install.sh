#!/usr/bin/env bash
# design-skills installer, by RedEagle01
#
#   ./install.sh                      install every skill in this repo
#   ./install.sh apple-hig            install only the skills you name
#   ./install.sh --list               list the skills, with what each one does
#   ./install.sh --help               show this help
#
# One line, without cloning first:
#   curl -fsSL https://raw.githubusercontent.com/EagleHeaven/design-skills/main/install.sh | bash
#
# Skills go to ~/.claude/skills (or $CLAUDE_SKILLS_DIR). A skill that is
# already there is renamed <name>.backup-YYYYMMDD-HHMMSS first: nothing is
# ever overwritten. NO_COLOR=1 turns colors off.
set -euo pipefail

REPO_URL="https://github.com/EagleHeaven/design-skills.git"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
STAMP="$(date +%Y%m%d-%H%M%S)"

if [ -t 1 ] && [ -z "${NO_COLOR:-}" ]; then
  RED=$'\033[1;31m'; DIM=$'\033[2m'; BOLD=$'\033[1m'
  GREEN=$'\033[32m'; YELLOW=$'\033[33m'; RESET=$'\033[0m'
  TTY=1
else
  RED=''; DIM=''; BOLD=''; GREEN=''; YELLOW=''; RESET=''
  TTY=0
fi

pretty_path() { printf '%s' "${1/#$HOME/~}"; }

banner() {
  local line
  printf '\n%s' "$RED"
  while IFS= read -r line; do
    printf '  %s\n' "$line"
    if [ "$TTY" = 1 ]; then sleep 0.04; fi
  done <<'ART'
██████╗ ███████╗██████╗     ███████╗ █████╗  ██████╗ ██╗     ███████╗
██╔══██╗██╔════╝██╔══██╗    ██╔════╝██╔══██╗██╔════╝ ██║     ██╔════╝
██████╔╝█████╗  ██║  ██║    █████╗  ███████║██║  ███╗██║     █████╗
██╔══██╗██╔══╝  ██║  ██║    ██╔══╝  ██╔══██║██║   ██║██║     ██╔══╝
██║  ██║███████╗██████╔╝    ███████╗██║  ██║╚██████╔╝███████╗███████╗
╚═╝  ╚═╝╚══════╝╚═════╝     ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝
ART
  printf '%s' "$RESET"
  printf '  %sdesign skills for Claude Code, by RedEagle01%s\n\n' "$DIM" "$RESET"
}

usage() {
  sed -n '2,14p' "$0" 2>/dev/null | sed 's/^# \{0,1\}//' || true
}

fail() { printf '  %s✗ %s%s\n' "$RED" "$1" "$RESET" >&2; exit 1; }

# The one-line description from a skill's SKILL.md, cut to fit a terminal.
describe() {
  local d
  d="$(sed -n 's/^description:[[:space:]]*//p' "$1/SKILL.md" | head -1)"
  if [ "${#d}" -gt 90 ]; then d="${d:0:87}..."; fi
  printf '%s' "$d"
}

# --- arguments ---------------------------------------------------------------
LIST=0
ARGS=()
for arg in "$@"; do
  case "$arg" in
    -h|--help) banner; usage; exit 0 ;;
    -l|--list) LIST=1 ;;
    -*) banner; fail "Unknown option: $arg (see --help)" ;;
    *) ARGS+=("$arg") ;;
  esac
done

banner

# --- where the skills come from ----------------------------------------------
# From the repo this script sits in, or, when piped from curl, a fresh clone.
TMP=""
cleanup() { if [ -n "$TMP" ]; then rm -rf "$TMP"; fi; }
trap cleanup EXIT

SCRIPT_DIR=""
if [ -n "${BASH_SOURCE[0]:-}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
fi

if [ -n "$SCRIPT_DIR" ] && [ -d "$SCRIPT_DIR/skills" ]; then
  SRC="$SCRIPT_DIR/skills"
else
  command -v git >/dev/null 2>&1 || fail "git is required to download the skills."
  TMP="$(mktemp -d)"
  printf '  %s↓ Downloading the skills…%s\n' "$DIM" "$RESET"
  git clone -q --depth 1 "$REPO_URL" "$TMP/design-skills" || fail "Could not download $REPO_URL"
  SRC="$TMP/design-skills/skills"
fi

AVAILABLE=()
for dir in "$SRC"/*/; do
  if [ -f "$dir/SKILL.md" ]; then AVAILABLE+=("$(basename "$dir")"); fi
done
[ "${#AVAILABLE[@]}" -gt 0 ] || fail "No skills found in $SRC"

if [ "$LIST" = 1 ]; then
  printf '  %sAvailable skills%s\n\n' "$BOLD" "$RESET"
  for skill in "${AVAILABLE[@]}"; do
    printf '  %s%s%s\n    %s%s%s\n\n' "$RED" "$skill" "$RESET" "$DIM" "$(describe "$SRC/$skill")" "$RESET"
  done
  exit 0
fi

if [ "${#ARGS[@]}" -gt 0 ]; then SKILLS=("${ARGS[@]}"); else SKILLS=("${AVAILABLE[@]}"); fi

# --- install -------------------------------------------------------------------
mkdir -p "$DEST"
printf '  %sInstalling into %s%s\n\n' "$BOLD" "$(pretty_path "$DEST")" "$RESET"

installed=0
missing=0
last_ok=""
for skill in "${SKILLS[@]}"; do
  if [ ! -f "$SRC/$skill/SKILL.md" ]; then
    printf '  %s✗%s %s %s(not in this repo, see --list)%s\n' "$RED" "$RESET" "$skill" "$DIM" "$RESET"
    missing=$((missing + 1))
    continue
  fi
  if [ -e "$DEST/$skill" ]; then
    mv "$DEST/$skill" "$DEST/$skill.backup-$STAMP"
    printf '  %s↺%s %s %s(previous version kept as %s.backup-%s)%s\n' \
      "$YELLOW" "$RESET" "$skill" "$DIM" "$skill" "$STAMP" "$RESET"
  fi
  cp -R "$SRC/$skill" "$DEST/$skill"
  if [ -f "$DEST/$skill/SKILL.md" ]; then
    printf '  %s✓%s %s%s%s\n' "$GREEN" "$RESET" "$BOLD" "$skill" "$RESET"
    printf '    %s%s%s\n' "$DIM" "$(describe "$DEST/$skill")" "$RESET"
    installed=$((installed + 1))
    last_ok="$skill"
  else
    fail "$skill was copied but SKILL.md is missing in $(pretty_path "$DEST/$skill")"
  fi
done

# --- summary -------------------------------------------------------------------
printf '\n'
if [ "$installed" -gt 0 ]; then
  plural="skills"; [ "$installed" -eq 1 ] && plural="skill"
  printf '  %s%s %s installed.%s Open a new Claude Code session to load them.\n' \
    "$GREEN" "$installed" "$plural" "$RESET"
  printf '  %sThen ask Claude to use one by name, for example /%s.%s\n' "$DIM" "$last_ok" "$RESET"
fi
printf '\n  %sFly high. RedEagle01%s\n\n' "$RED" "$RESET"
[ "$missing" -eq 0 ] || exit 1
