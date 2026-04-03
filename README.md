<div align="center">
  <h1>Waza</h1>
  <p><em>技 — know the move before you need it.</em></p>
  <a href="https://github.com/tw93/waza/stargazers"><img src="https://img.shields.io/github/stars/tw93/waza?style=flat-square" alt="Stars"></a>
  <a href="https://github.com/tw93/waza/releases"><img src="https://img.shields.io/github/v/tag/tw93/waza?label=version&style=flat-square" alt="Version"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square" alt="License"></a>
  <a href="https://twitter.com/AiTw93"><img src="https://img.shields.io/badge/follow-Tw93-red?style=flat-square&logo=Twitter" alt="Twitter"></a>
</div>

<br/>

Eight skills for everyday software work: requirements, architecture, code review, debugging, design, reading, writing, and config health. Each skill is a focused methodology, no framework overhead, no telemetry.

## Skills

| Skill | Trigger | What it does |
| :--- | :--- | :--- |
| `/think` | Before building anything new | Challenges assumptions, explores scope from a CEO/founder perspective. Design-first gate: no code until design is approved. |
| `/look` | Before coding, after design | Architecture review: dependency graph, data flow, test coverage, performance. Opinionated recommendations. |
| `/check` | After a task, before merging | Code review with fix-first approach. Auto-fixes safe issues, batches judgment calls, verifies with evidence. |
| `/hunt` | Any bug or unexpected behavior | Systematic debugging. Root cause before any fix. Iron Law: no fixes without root cause investigation. |
| `/design` | Building frontend interfaces | Produces distinctive UI with a committed aesthetic direction. Avoids generic AI aesthetics. |
| `/read` | Any URL or PDF | Fetches content as clean Markdown. Routes WeChat/Feishu to dedicated scripts, everything else through r.jina.ai. |
| `/write` | Writing or editing prose | Enforces natural style for Chinese and English. Strips AI writing patterns. |
| `/health` | Config feels off | Audits Claude Code setup across six layers: CLAUDE.md, rules, skills, hooks, MCP, behavior. |

## Install

**Single skill (recommended for most users):**

```bash
claude plugin marketplace add tw93/waza
claude plugin install health@waza
```

Replace `health` with any skill name to install a different one.

**All skills via npx:**

```bash
npx skills add tw93/waza -g -y
```

**Local install (clone and symlink):**

```bash
git clone https://github.com/tw93/waza.git ~/www/waza
bash ~/www/waza/install.sh
```

## Background

Built around patterns from real projects. The methodologies are distilled from [gstack](https://github.com/obra/gstack) and [superpowers](https://github.com/obra/superpowers), stripped of framework overhead, and tuned for Rust/Lua/shell work. The `/health` skill is based on the six-layer framework described in [this post](https://tw93.fun/en/2026-03-12/claude.html).

## License

MIT
