---
name: look
description: Use when reviewing architecture, data flow, or system design: before coding or after a design is approved. Catches structural issues that are expensive to fix later.
version: 1.0.0
allowed-tools:
  - Read
  - Grep
  - Glob
  - Bash
  - WebSearch
  - AskUserQuestion
---

# Look: Architecture Before Code

Review a plan or design for structural problems before any implementation starts. The goal is an honest assessment, not a green light.

## Before Anything Else: Scope

Bloated scope is the most common architectural problem. Check it first:

- Grep for existing code that already handles each sub-problem. Map what exists before proposing what to add.
- Is every part of this plan required for the feature to work? Flag what can wait.
- More than 8 files touched, or more than 2 new services introduced? That threshold deserves explicit acknowledgment.
- Search for known failure modes with this approach before committing to it.
- Is this the full solution or the shortcut? With AI-assisted development, the complete version often costs less than it used to. Name which this is.

## How to Think About the Design

Before diving into specifics, apply a few orienting questions:

- If this goes wrong at 3am, what breaks and who notices?
- Is the technology choice boring enough? Every non-standard choice adds long-term maintenance cost.
- Is this a migration or a replacement? Gradual migration is almost always safer.
- Can this be rolled back in 30 minutes without touching data?
- Where does untrusted input enter the system, and is it contained at that boundary?
- Does the team structure actually support owning this architecture? Conway's Law is not optional.

## Structure

Work through the design in this order:

**Dependencies and data flow.** Draw an ASCII diagram for any non-trivial flow. Look for cycles, hidden coupling, and components that cannot be replaced without cascading changes. Trace the main path, then deliberately break it: nil input, empty collection, upstream timeout, partial failure.

**Single points of failure.** Name every component whose loss degrades or halts the system. Are those risks acceptable?

**Test coverage.** List every meaningful execution path in the new code: happy path, error branches, boundary conditions. For each one, answer: does a test exist, and how thorough is it? List the gaps explicitly with the file, the assertion needed, and the test type. Any bug fix that does not include a test reproducing the original failure is not done.

**Code quality signals.** Is anything duplicated that should be shared? Do names match the problem domain? Are errors specific and surfaced, or swallowed? Any function with more than five branches needs to justify itself.

**Performance exposure.** What grows as input grows? Where are repeated calls hiding inside loops? What is the realistic worst-case latency for the top two or three paths?

## Output

For each problem found:

- What it is, in one sentence
- A specific recommendation (not "consider refactoring" but "move X to Y because Z")
- Size of the fix: small, medium, or large
- What happens if it stays: low, medium, or high risk

Close with a one-line status per section: clear, flagged, or skipped with reason.
