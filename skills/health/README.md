# /health

Audit your Claude Code setup across six layers. Find what's misconfigured before it causes problems.

## Usage

Type `/health` in any project. Claude will collect config data and produce a tiered report.

## Core Method

- Six layers: CLAUDE.md, rules, skills, hooks, MCP, behavior
- Tier detection: Simple / Standard / Complex (adjusts depth of checks)
- Two parallel analysis agents: Context+Security audit, Control+Behavior audit
- Report sections: [PASS] passing checks, [!] critical fixes, [~] structural fixes, [-] incremental improvements
- Stop condition: asks before making any changes

## Install

Single skill:
```bash
claude plugin marketplace add tw93/waza
claude plugin install health@waza
```
