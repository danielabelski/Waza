# /check

Code review with a fix-first approach. Auto-fixes safe issues, batches judgment calls, verifies with evidence.

## Usage

Type `/check` after completing a task or before merging. Point it at a file, diff, or describe what changed.

## Core Method

- Iron Law: no completion claim without running the verification command
- Two-pass review: CRITICAL issues first, then INFORMATIONAL
- AUTO-FIX: safe mechanical fixes applied immediately (formatting, obvious bugs)
- ASK: judgment calls batched and presented together, not one at a time
- Evidence requirement: every finding includes file path and line number

## Install

Single skill:
```bash
claude plugin marketplace add tw93/waza
claude plugin install check@waza
```
