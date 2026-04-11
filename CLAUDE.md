# Waza

Personal skill collection for Claude Code. Eight skills covering the complete engineering workflow: think, design, check, hunt, write, learn, read, health.

## Structure

```
skills/
├── check/        -- code review before merging
│   ├── agents/   -- reviewer-security.md, reviewer-architecture.md
│   └── references/  -- persona-catalog.md
├── design/       -- production-grade frontend UI
├── health/       -- Claude Code config audit
│   └── agents/   -- inspector-context.md, inspector-control.md
├── hunt/         -- systematic debugging
├── learn/        -- research to published output
├── read/         -- fetch URL or PDF as Markdown
├── think/        -- design and validate before building
└── write/        -- natural prose in Chinese and English
    └── references/  -- write-zh.md, write-en.md
marketplace.json      -- plugin registry for npx/plugin distribution
```

Each skill has a `SKILL.md` (loaded on demand by Claude). Supporting content lives in subdirectories.

## Verification

Run `./scripts/verify-skills.sh` before any commit. If the diff is non-trivial, also run `/check`.

## Commit Convention

`{type}: {description}` -- types: feat, fix, refactor, docs, chore

## Release Convention (tw93/miaoyan style)

- Title: `V{version} {Codename} {emoji}` -- e.g., V1.3.0 Guardian
- Tag: `v{version}` (lowercase v)
- Body: HTML format, bilingual (English Changelog + 中文更新日志), one-to-one
- Each item: `<li><strong>Category</strong>: description.</li>` -- bold label summarizes the change, description is one concise sentence, no filler words
- Style: engineer-facing, no marketing language; lead with what changed, not why it matters
- Footer: update command `npx skills add tw93/Waza@latest` + star + repo link
