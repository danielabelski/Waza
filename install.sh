#!/bin/bash
# Waza skill installer — symlinks all skills into ~/.claude/skills/
set -e

WAZA_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

mkdir -p "$SKILLS_DIR"

for dir in "$WAZA_DIR"/skills/*/; do
  name=$(basename "$dir")
  target="$SKILLS_DIR/$name"
  ln -sfn "$dir" "$target"
  echo "  linked: $name -> $target"
done

echo ""
echo "Waza installed. Available skills:"
for dir in "$WAZA_DIR"/skills/*/; do
  name=$(basename "$dir")
  desc=$(grep '^description:' "$dir/SKILL.md" 2>/dev/null | head -1 | sed 's/description: *//' | tr -d '"')
  printf "  /%-10s %s\n" "$name" "$desc"
done
