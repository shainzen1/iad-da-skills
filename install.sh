#!/usr/bin/env bash
# Installiert die Skills nach ~/.claude/skills/
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)/skills"
DEST="$HOME/.claude/skills"
mkdir -p "$DEST"

for skill in da-schreiben ki-protokoll; do
  if [ -d "$DEST/$skill" ]; then
    printf '%s existiert bereits. Ueberschreiben? [j/N] ' "$DEST/$skill"
    read -r answer </dev/tty
    case "$answer" in
      j|J|y|Y) rm -rf "$DEST/$skill" ;;
      *) echo "  uebersprungen: $skill"; continue ;;
    esac
  fi
  cp -R "$SRC/$skill" "$DEST/$skill"
  echo "  installiert: $skill"
done

chmod +x "$DEST/da-schreiben/audit.sh" 2>/dev/null || true

echo
echo "Fertig. Claude Code neu starten, dann /da-schreiben oder /ki-protokoll."
echo "Fuer das Protokoll zusaetzlich einrichten:"
echo "  skills/ki-protokoll/templates/CLAUDE-snippet.md in die CLAUDE.md im DA-Ordner"
