#!/usr/bin/env bash
# Installe les skills Claude Code android-material et apple-hig.
# Usage : ./install.sh   (ou : bash <(curl -fsSL URL/install.sh))
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)/skills"
DEST="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
STAMP="$(date +%Y%m%d-%H%M%S)"

mkdir -p "$DEST"
for skill in android-material apple-hig; do
  if [ -e "$DEST/$skill" ]; then
    mv "$DEST/$skill" "$DEST/$skill.backup-$STAMP"
    echo "Ancienne version sauvegardée : $DEST/$skill.backup-$STAMP"
  fi
  cp -R "$SRC/$skill" "$DEST/$skill"
  test -f "$DEST/$skill/SKILL.md" && echo "Installé : $DEST/$skill"
done
echo "Ouvre une nouvelle session Claude Code pour charger les skills."
