#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="${1:-"$ROOT/dist/waza.zip"}"

mkdir -p "$(dirname "$OUT")"
rm -f "$OUT"

cd "$ROOT"

MANIFEST="$(mktemp)"
FILTERED_MANIFEST="$(mktemp)"
trap 'rm -f "$MANIFEST" "$FILTERED_MANIFEST"' EXIT

git ls-files --cached --others --exclude-standard > "$MANIFEST"

awk '
  /^\.claude-plugin\// { next }
  /^\.claude\// { next }
  /^\.github\// { next }
  /^dist\// { next }
  /^Makefile$/ { next }
  /^skills-lock\.json$/ { next }
  /^scripts\/verify-skills\.sh$/ { next }
  /^scripts\/statusline\.sh$/ { next }
  /^scripts\/setup-statusline\.sh$/ { next }
  /^scripts\/package-skill\.sh$/ { next }
  /(^|\/)__pycache__\// { next }
  /\.pyc$/ { next }
  /(^|\/)\.DS_Store$/ { next }
  { print }
' "$MANIFEST" > "$FILTERED_MANIFEST"

zip -q "$OUT" -@ < "$FILTERED_MANIFEST"

if ! zipinfo -1 "$OUT" | awk '$0 == "SKILL.md" { found = 1 } END { exit found ? 0 : 1 }'; then
  echo "ERROR: root SKILL.md missing from $OUT" >&2
  exit 1
fi

SIZE=$(wc -c < "$OUT" | tr -d ' ')
echo "OK: wrote $OUT (${SIZE} bytes)"
