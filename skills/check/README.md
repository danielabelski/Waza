# /check

Code review with a fix-first approach. Auto-fixes safe issues, batches judgment calls, verifies with evidence.

## Usage

Type `/check` after completing a task or before merging. Point it at a file, diff, or describe what changed.

## Core Method

- Iron Law: no completion claim without running the verification command
- Two-pass review: **Hard stops** (fix before merging) then **Soft signals** (flag, do not block)
- Hard stops: injection, shared state races, external trust issues, missing match cases
- Soft signals: magic literals, dead code, untested paths, loop queries
- AUTO-FIX: unambiguous issues fixed directly (clear bugs, null checks, style inconsistencies)
- ASK: behavior changes and architectural choices batched into one AskUserQuestion
- Sign-off format: files changed, scope, hard stops, signals, new tests, verification result

## Install

```bash
npx skills add tw93/Waza -a claude-code -s check -y
```
