# /health

Audit your Claude Code setup across six layers. Find what is misconfigured before it causes problems.

## Usage

Type `/health` in any project. Claude will collect config data, detect the project tier, and produce a structured report.

## Core Method

- Six layers: CLAUDE.md, rules, skills, hooks, MCP, behavior
- Tier detection: Simple / Standard / Complex (adjusts depth of checks automatically)
- Two parallel analysis agents: Context and Security audit (Agent 1), Control and Behavior audit (Agent 2)
- Report sections: [PASS] passing checks, [!] critical fixes, [~] structural fixes, [-] incremental improvements
- Stop condition: Claude flags issues and asks before making any changes

## Install

```bash
npx skills add tw93/Waza -a claude-code -s health -y
```
