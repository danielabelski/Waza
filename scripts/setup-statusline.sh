#!/bin/bash
# Install Waza statusline into Claude Code
set -e

DEST="$HOME/.claude/statusline.sh"
SETTINGS="$HOME/.claude/settings.json"
RAW="https://raw.githubusercontent.com/tw93/Waza/main/scripts/statusline.sh"

# Download script
curl -sL "$RAW" -o "$DEST"
chmod +x "$DEST"
echo "Downloaded statusline.sh -> $DEST"

# Update settings.json
python3 - <<PYEOF
import json, os

path = os.path.expanduser("~/.claude/settings.json")
d = {}
if os.path.exists(path):
    with open(path) as f:
        try:
            d = json.load(f)
        except Exception:
            d = {}

d["statusLine"] = {"type": "command", "command": "bash ~/.claude/statusline.sh"}

with open(path, "w") as f:
    json.dump(d, f, indent=2)
    f.write("\n")

print("Updated ~/.claude/settings.json")
PYEOF

echo "Done. Restart Claude Code to see the statusline."
