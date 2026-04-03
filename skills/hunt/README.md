# /hunt

Systematic debugging. Root cause before any fix. No guessing.

## Usage

Type `/hunt` when facing a bug or unexpected behavior. Describe the symptom -- Claude will drive a structured investigation.

## Core Method

- Iron Law: no fix without confirmed root cause
- 5 phases: Observe, Hypothesize, Isolate, Confirm, Fix
- 3-Strike Rule: if three hypotheses fail, stop and reassess the problem framing
- DEBUG REPORT format: symptom, root cause, evidence chain, fix applied, verification

## Install

Single skill:
```bash
claude plugin marketplace add tw93/waza
claude plugin install hunt@waza
```
