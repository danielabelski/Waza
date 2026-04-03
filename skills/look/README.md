# /look

Architecture review before you commit to a design. Finds structural problems while they're still cheap to fix.

## Usage

Type `/look` in Claude Code before coding, or after a design is approved. Works on plans, PRs, or existing code.

## Core Method

- Step 0: Scope Challenge -- existing leverage, minimum changes, complexity smell
- Architecture: dependency graph (ASCII), data flow, coupling, SPOFs, security surface
- Tests: codepath trace, coverage diagram, regression Iron Rule
- Code Quality: DRY, naming, error handling, cyclomatic complexity
- Performance: N+1 queries, memory growth, caching opportunities

## Install

Single skill:
```bash
claude plugin marketplace add tw93/waza
claude plugin install look@waza
```
