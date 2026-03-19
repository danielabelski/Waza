# Claude Health

Configuration health audit skill for Claude Code.

## Communication

- Do not use em dashes (U+2014) in any output. Use commas, periods, colons, or semicolons instead.

## Structure

- `skills/health/SKILL.md` -- the only source file, contains all audit logic
- Two parallel agents: Agent 1 (context + skill security), Agent 2 (control + behavior)

## Verification

```bash
# Syntax check: extract bash blocks and check syntax (macOS compatible)
awk '/^```bash$/{p=1;next} /^```$/{p=0} p' skills/health/SKILL.md | bash -n

# Word count: SKILL.md should stay under 3500 words
wc -w skills/health/SKILL.md

# Version consistency: frontmatter version and marketplace.json must match
grep 'version:' skills/health/SKILL.md | head -1
grep '"version"' .claude-plugin/marketplace.json

# Claude Code install smoke test: project-local install should land in .claude/skills
TMP_HOME=$(mktemp -d) && TMP_PROJ=$(mktemp -d) && \
cd "$TMP_PROJ" && \
HOME="$TMP_HOME" XDG_CONFIG_HOME="$TMP_HOME/.config" npx skills add tw93/claude-health -a claude-code -s health -y --copy && \
test -f "$TMP_PROJ/.claude/skills/health/SKILL.md"
```

## Commit Convention

`{type}: {description}` -- types: feat, fix, refactor, docs, chore

## Release Convention (tw93/miaoyan style)

- Title: `V{version} {Codename} {emoji}` -- e.g., V1.3.0 Guardian
- Tag: `v{version}` (lowercase v)
- Body: HTML format, bilingual (English Changelog + 中文更新日志), one-to-one
- Each item: `<li><strong>Category</strong>: description.</li>` -- bold label summarizes the change, description is one concise sentence, no filler words
- Style: engineer-facing, no marketing language; lead with what changed, not why it matters
- Footer: update command `npx skills add tw93/claude-health@latest` + star + repo link
