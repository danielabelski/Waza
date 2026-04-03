---
name: hunt
description: Use when encountering any bug, crash, unexpected behavior, or test failure: before proposing fixes. Root cause first, always.
version: 1.0.0
allowed-tools:
  - Bash
  - Read
  - Edit
  - Write
  - Grep
  - Glob
  - WebSearch
  - AskUserQuestion
---

# Hunt: Diagnose Before You Fix

A patch applied to a symptom creates a new bug somewhere else. Find the origin first.

**Do not touch code until you can state the root cause in one sentence.**

## Orientation

Start by building a complete picture of what happened:

- Get the exact error, stack trace, and steps to reproduce. If anything is missing, ask one specific question.
- Run `git log --oneline -20 -- <affected files>`. Regressions almost always live in recent changes.
- Trace the execution path from the symptom backward: follow the data, not intuition.
- Reproduce it yourself. If you cannot reproduce it reliably, you do not understand it yet.

Before going further, commit to a testable claim:
> "I believe the root cause is [X] because [evidence]."

## Known Failure Shapes

When a hypothesis is hard to form, match the symptom to a known shape:

| Shape | Clues | Where to look |
|-------|-------|---------------|
| Timing problem | Intermittent, load-dependent | Concurrent access to shared state |
| Missing guard | Crash on field or index access | Optional values, empty collections |
| Ordering bug | Works in isolation, fails in sequence | Event callbacks, transaction scope |
| Boundary failure | Timeout, wrong response shape | External APIs, service edges |
| Environment mismatch | Local pass, CI fail | Env vars, feature flags, seeded data |
| Stale value | Old data shown, refreshes on restart | In-memory cache, memoized result |

Also worth checking: existing TODOs near the failure site, and whether this area has been patched before. Recurring fixes in the same place mean the abstraction is wrong.

## Confirm or Discard the Hypothesis

Add one targeted instrument: a log line, a failing assertion, or the smallest possible test that would fail if the hypothesis is correct. Run it.

If the evidence contradicts the hypothesis, discard it completely and re-orient with what was just learned. Do not preserve a hypothesis that the evidence disproves.

After three failed hypotheses, stop. Do not guess a fourth time. Instead, surface the situation to the user: what was checked, what was ruled out, what is still unknown. Ask whether to add more instrumentation, escalate, or approach the problem differently.

Stop and reassess if you catch yourself:
- Writing a fix before you have finished tracing the flow
- Thinking "let me just try this"
- Finding that each fix surfaces a new problem in a different module

## Apply the Fix

Once the root cause is confirmed:

- Fix the cause, not the symptom it produces
- Keep the diff small: fewest files, fewest lines
- Write one regression test that fails on the unfixed code and passes after the fix
- Run the full test suite and paste the complete output, no summaries
- If the change touches more than 5 files, pause and confirm the scope with the user

## Outcome

End with a short summary:

```
Root cause:  [what was wrong, file:line]
Fix:         [what changed, file:line]
Confirmed:   [evidence or test that proves the fix]
Tests:       [pass/fail count, regression test location]
```

Status is one of: **resolved**, **resolved with caveats** (state them), or **blocked** (state what is unknown and why).
