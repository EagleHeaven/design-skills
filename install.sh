#!/usr/bin/env bash
# design-skills installer, by RedEagle01
#
#   ./install.sh                      install everything: our skills, partner skills, plugins
#   ./install.sh --core               install only the skills in this repo
#   ./install.sh apple-hig            install only the skills you name (from this repo)
#   ./install.sh --list               list everything this kit installs
#   ./install.sh --help               show this help
#
# One line, without cloning first:
#   curl -fsSL https://raw.githubusercontent.com/EagleHeaven/design-skills/main/install.sh | bash
#
# Our skills go to ~/.claude/skills (or $CLAUDE_SKILLS_DIR). A skill already
# there is renamed <name>.backup-YYYYMMDD-HHMMSS first: nothing is overwritten.
# Partner skills need Node (npx); plugins need the `claude` CLI. NO_COLOR=1
# turns colors off.

# ---- kit ---------------------------------------------------------------------
KIT_TAGLINE="design skills for Claude Code, by RedEagle01"
REPO_URL="https://github.com/EagleHeaven/design-skills.git"

# Partner skills, installed from their authors' repos with `npx skills`.
# "owner/repo|what it brings"
SKILL_PACKS=(
  "emilkowalski/skills|animation, gestures and design engineering (Emil Kowalski)"
  "leonxlnx/taste-skill|anti-generic frontend taste (Leon)"
)

# Claude Code plugins. "plugin@marketplace|marketplace source|what it brings"
PLUGINS=(
  "frontend-design@claude-plugins-official|anthropics/claude-plugins-official|distinctive frontend design (Anthropic)"
  "impeccable@impeccable|pbakaus/impeccable|design audit and polish commands (Paul Bakaus)"
)

# ---- engine (same in every RedEagle01 kit) -----------------------------------
set -euo pipefail

main() {
  DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
  STAMP="$(date +%Y%m%d-%H%M%S)"
  setup_colors

  local list=0 core=0 arg
  local names=()
  for arg in "$@"; do
    case "$arg" in
      -h|--help) banner; usage; return 0 ;;
      -l|--list) list=1 ;;
      --core) core=1 ;;
      -*) banner; fail "Unknown option: $arg (see --help)" ;;
      *) names+=("$arg") ;;
    esac
  done
  # Naming skills means: only those, from this repo.
  if [ "${#names[@]}" -gt 0 ]; then core=1; fi

  banner
  find_source

  if [ "$list" = 1 ]; then show_list; return 0; fi

  local failures=0
  install_ours "${names[@]+"${names[@]}"}" || failures=$((failures + $?))
  if [ "$core" = 0 ]; then
    install_packs || failures=$((failures + $?))
    install_plugins || failures=$((failures + $?))
  fi

  printf '\n'
  if [ "$failures" -eq 0 ]; then
    printf '  %sAll done.%s Open a new Claude Code session to load everything.\n' "$GREEN" "$RESET"
  else
    printf '  %s%s step(s) did not finish.%s The rest is installed; see the ✗ lines above.\n' "$YELLOW" "$failures" "$RESET"
  fi
  printf '\n  %sFly high. RedEagle01%s\n\n' "$RED" "$RESET"
  [ "$failures" -eq 0 ]
}

setup_colors() {
  if [ -t 1 ] && [ -z "${NO_COLOR:-}" ]; then
    RED=$'\033[1;31m'; DIM=$'\033[2m'; BOLD=$'\033[1m'
    GREEN=$'\033[32m'; YELLOW=$'\033[33m'; RESET=$'\033[0m'; TTY=1
  else
    RED=''; DIM=''; BOLD=''; GREEN=''; YELLOW=''; RESET=''; TTY=0
  fi
}

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
  printf '%s  %s%s%s\n\n' "$RESET" "$DIM" "$KIT_TAGLINE" "$RESET"
}

usage() {
  if [ -f "${BASH_SOURCE[0]:-}" ]; then
    sed -n '2,17p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
  else
    printf '  Options: --core, --list, --help, or skill names. See the README.\n'
  fi
}

fail() { printf '  %s✗ %s%s\n' "$RED" "$1" "$RESET" >&2; exit 1; }
section() { printf '\n  %s%s%s\n' "$BOLD" "$1" "$RESET"; }
ok() { printf '  %s✓%s %s\n' "$GREEN" "$RESET" "$1"; }
warn() { printf '  %s✗%s %s\n' "$RED" "$RESET" "$1"; }
note() { printf '    %s%s%s\n' "$DIM" "$1" "$RESET"; }
pretty_path() { printf '%s' "${1/#$HOME/~}"; }

describe() {
  local d
  d="$(sed -n 's/^description:[[:space:]]*//p' "$1/SKILL.md" | head -1)"
  if [ "${#d}" -gt 90 ]; then d="${d:0:87}..."; fi
  printf '%s' "$d"
}

# Skills come from the repo this script sits in, or from a fresh clone when
# the script is piped from curl.
TMP=""
cleanup() { if [ -n "$TMP" ]; then rm -rf "$TMP"; fi; }
trap cleanup EXIT

find_source() {
  local dir=""
  if [ -n "${BASH_SOURCE[0]:-}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
    dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  fi
  if [ -n "$dir" ] && [ -d "$dir/skills" ]; then
    SRC="$dir/skills"
  else
    command -v git >/dev/null 2>&1 || fail "git is required to download the skills."
    TMP="$(mktemp -d)"
    note "Downloading the kit…"
    git clone -q --depth 1 "$REPO_URL" "$TMP/kit" </dev/null || fail "Could not download $REPO_URL"
    SRC="$TMP/kit/skills"
  fi
  OURS=()
  for dir in "$SRC"/*/; do
    if [ -f "$dir/SKILL.md" ]; then OURS+=("$(basename "$dir")"); fi
  done
}

show_list() {
  local s entry
  section "Our skills (copied into $(pretty_path "$DEST"))"
  for s in "${OURS[@]+"${OURS[@]}"}"; do
    printf '  %s%s%s\n' "$RED" "$s" "$RESET"; note "$(describe "$SRC/$s")"
  done
  if [ "${#SKILL_PACKS[@]}" -gt 0 ]; then
    section "Partner skills (installed from their authors with npx skills)"
    for entry in "${SKILL_PACKS[@]}"; do
      printf '  %s%s%s\n' "$RED" "${entry%%|*}" "$RESET"; note "${entry#*|}"
    done
  fi
  if [ "${#PLUGINS[@]}" -gt 0 ]; then
    section "Claude Code plugins"
    for entry in "${PLUGINS[@]}"; do
      printf '  %s%s%s\n' "$RED" "${entry%%|*}" "$RESET"; note "${entry##*|}"
    done
  fi
  printf '\n'
}

install_ours() {
  local skills=("$@") s failed=0
  if [ "${#skills[@]}" -eq 0 ]; then skills=("${OURS[@]+"${OURS[@]}"}"); fi
  [ "${#skills[@]}" -gt 0 ] || return 0
  section "Our skills → $(pretty_path "$DEST")"
  mkdir -p "$DEST"
  for s in "${skills[@]}"; do
    if [ ! -f "$SRC/$s/SKILL.md" ]; then
      warn "$s"; note "not in this repo (see --list)"; failed=$((failed + 1)); continue
    fi
    if [ -e "$DEST/$s" ]; then
      mv "$DEST/$s" "$DEST/$s.backup-$STAMP"
      ok "$s"; note "previous version kept as $s.backup-$STAMP"
    else
      ok "$s"
    fi
    cp -R "$SRC/$s" "$DEST/$s"
    [ -f "$DEST/$s/SKILL.md" ] || { warn "$s copied without SKILL.md"; failed=$((failed + 1)); }
  done
  return "$failed"
}

install_packs() {
  local entry repo failed=0
  [ "${#SKILL_PACKS[@]}" -gt 0 ] || return 0
  section "Partner skills (from their authors)"
  if ! command -v npx >/dev/null 2>&1; then
    warn "Node.js is missing, partner skills skipped"; note "Install Node.js, then run this script again."
    return 1
  fi
  for entry in "${SKILL_PACKS[@]}"; do
    repo="${entry%%|*}"
    if npx --yes skills add "$repo" --full-depth -g -a claude-code -s '*' -y </dev/null >/dev/null 2>&1; then
      ok "$repo"; note "${entry#*|}"
    else
      warn "$repo"; note "retry: npx skills add $repo --full-depth -g -a claude-code -s '*' -y"
      failed=$((failed + 1))
    fi
  done
  return "$failed"
}

install_plugins() {
  local entry id market source failed=0
  [ "${#PLUGINS[@]}" -gt 0 ] || return 0
  section "Claude Code plugins"
  if ! command -v claude >/dev/null 2>&1; then
    warn "the claude CLI is missing, plugins skipped"; note "Install Claude Code, then run this script again."
    return 1
  fi
  for entry in "${PLUGINS[@]}"; do
    id="${entry%%|*}"; market="${id#*@}"
    source="${entry#*|}"; source="${source%%|*}"
    if ! claude plugin marketplace list </dev/null 2>/dev/null | grep -q "$market"; then
      claude plugin marketplace add "$source" </dev/null >/dev/null 2>&1 || true
    fi
    if claude plugin install "$id" -s user </dev/null >/dev/null 2>&1; then
      ok "${id%@*}"; note "${entry##*|}"
    else
      warn "${id%@*}"; note "retry: claude plugin install $id"
      failed=$((failed + 1))
    fi
  done
  return "$failed"
}

# Everything above is only definitions: bash reads the whole file before
# running it, so `curl | bash` cannot be cut short by a command reading stdin.
main "$@"
