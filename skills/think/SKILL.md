---
name: think
description: Use before building anything new: brainstorm requirements, challenge assumptions, explore scope from a CEO/founder perspective. Design-first: no implementation until design is approved.
version: 1.0.0
allowed-tools:
  - Read
  - Grep
  - Glob
  - Bash
  - WebSearch
  - AskUserQuestion
---

# Think: Design Before You Build

Turn a rough idea into a clear, agreed-upon plan. Writing code before the design is approved is not allowed, regardless of how simple the request appears.

## How It Works

Read the relevant files and recent commits first: understand what already exists before asking anything. Then work through the idea with the user one question at a time, purpose first, constraints second, success criteria third.

Before proposing a design, challenge whether it is the right design:
- What does the user actually want to happen? Not the feature they described, the outcome they care about.
- What changes if nothing is built? Is there a cheaper path to the same result?
- What is already in the codebase that covers part of this? Map sub-problems to existing code first.
- Does this decision hold up in 12 months, or does it create drag?

Once the framing is solid, offer 2 or 3 approaches with tradeoffs and a recommendation. Get approval. Then hand off to `/look` for architecture review, `/design` for UI work, or straight to implementation.

## Scope Calibration

Name the mode at the start based on the type of request:

| Mode | Request type | What it means |
|------|-------------|---------------|
| **expand** | New feature, blank slate | Ask what would make this 10x better. Push scope outward. |
| **shape** | Adding to existing | Baseline is fixed. Identify expansion opportunities individually. |
| **hold** | Bug fix, tight constraints | Scope is locked. Make it correct and nothing else. |
| **cut** | Plan that grew too large | Strip back to the minimum that solves the real problem. |

## Evaluating Options

When comparing approaches, ask:

- Which decision is hard to undo, and which is easy? Treat them differently: move fast on reversible choices, slow down on permanent ones.
- What would cause this to fail? Start from the failure mode and design away from it.
- What are we explicitly not building? Name it.
- Would the same result hold if this shipped with less: fewer fields, fewer states, fewer APIs?
- Is the metric being optimized the real thing, or a proxy that has drifted?

For each approach, cover: what it is in one sentence, estimated effort, risk level, the two strongest reasons for and against, and which existing code it builds on. Always include one option that is minimal and one that is architecturally complete.

## Approved Design Format

Present the design for explicit approval:

- **Building**: what this is (one paragraph)
- **Not building**: explicit list of things out of scope
- **Chosen approach**: which one and why
- **Decisions**: 3 to 5 specific choices with reasoning
- **Unknowns**: anything that needs to be resolved during implementation

After approval: "Ready to start? I can move to `/look` for architecture, `/design` for the UI, or go straight to code."
