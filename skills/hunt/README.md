# /hunt

Systematic debugging. Root cause before any fix. No guessing.

## Usage

Type `/hunt` when facing a bug or unexpected behavior. Describe the symptom. Claude will drive a structured investigation.

## Core Method

- Iron Law: no fix without confirmed root cause
- Orientation: reproduce the bug, trace backward from the symptom, commit to a testable claim
- Known Failure Shapes table: timing, missing guard, ordering, boundary, environment, stale value
- Confirm or Discard: add one targeted instrument (log, assertion, test), run it, discard any disproven hypothesis
- 3-Strike Rule: after three failed hypotheses, stop and surface to the user what was checked and what is unknown
- Apply the Fix: fix the cause not the symptom, keep the diff small, write a regression test

## Outcome Format

```
Root cause:  [what was wrong, file:line]
Fix:         [what changed, file:line]
Confirmed:   [evidence or test that proves the fix]
Tests:       [pass/fail count, regression test location]
```

Status: **resolved** / **resolved with caveats** / **blocked**

## Install

```bash
npx skills add tw93/Waza -a claude-code -s hunt -y
```
