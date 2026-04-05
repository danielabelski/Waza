# /think

Challenge assumptions and define scope before writing a single line of code.

## Usage

Type `/think` when starting a new feature, reviewing a plan, or when something feels off about the direction. Claude will challenge the problem, propose approaches, and validate architecture before any implementation begins.

## Core Method

- Phase 1: Understand the problem. Challenge whether it is the right problem to solve.
- Scope Mode selection: **expand** (new feature) / **shape** (adding to existing) / **hold** (bug fix) / **cut** (plan too large)
- Phase 2: Propose 2 or 3 options with tradeoffs, effort, risk, and a recommendation
- Phase 3: Validate architecture: scope, dependencies, test coverage, risk
- Hard gate: no code until design is explicitly approved

## Output

```
Building:      what this is (1 paragraph)
Not building:  explicit out-of-scope list
Approach:      chosen option with rationale
Key decisions: 3-5 with reasoning
Unknowns:      anything needing resolution during implementation
```

## Install

```bash
npx skills add tw93/Waza -a claude-code -s think -y
```
