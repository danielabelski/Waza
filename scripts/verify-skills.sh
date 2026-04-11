#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

# All SKILL.md files have valid frontmatter
for f in skills/*/SKILL.md; do
  if head -5 "$f" | grep -q "^name:"; then
    echo "ok: $f"
  else
    echo "MISSING name: $f" >&2
    exit 1
  fi
done

# Version consistency: SKILL.md must match marketplace.json
for skill in check design health hunt learn read think write; do
  skill_ver=$(grep -m1 "version:" "skills/$skill/SKILL.md" | tr -d '"' | awk '{print $2}')
  market_ver=$(python3 -c "import json; d=json.load(open('marketplace.json')); print([p['version'] for p in d['plugins'] if p['name']=='$skill'][0])")
  if [ "$skill_ver" = "$market_ver" ]; then
    echo "ok: $skill $skill_ver"
  else
    echo "MISMATCH: $skill SKILL=$skill_ver MARKET=$market_ver" >&2
    exit 1
  fi
done

# Reference files exist for skills that use them
test -f skills/design/references/design-reference.md && \
test -f skills/read/references/read-methods.md && \
test -f skills/write/references/write-zh.md && \
test -f skills/write/references/write-en.md && \
test -f skills/health/agents/inspector-context.md && \
test -f skills/health/agents/inspector-control.md && \
test -f skills/check/agents/reviewer-security.md && \
test -f skills/check/agents/reviewer-architecture.md && \
test -f skills/check/references/persona-catalog.md && echo "references: ok"

# marketplace.json is valid JSON
python3 -c "import json; json.load(open('marketplace.json'))" && echo "marketplace.json: ok"
