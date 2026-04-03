# /write

Enforce natural writing style for Chinese and English. Strip AI writing patterns.

## Usage

Type `/write` before drafting or editing any prose: blog posts, docs, commit messages, emails. Works in both Chinese and English.

## Core Method

- 14-point AI pattern detection: filters hollow openers, filler transitions, summary redundancy
- Chinese rules: no "首先/其次/最后" scaffolding, no "值得注意的是", no abstract noun pileups
- English rules: no "It's worth noting", no "In conclusion", no em dashes, no over-hedging
- Sentence rhythm: vary length deliberately, concrete details over abstractions
- `disable-model-invocation: true` to prevent skill from triggering itself recursively

## Install

Single skill:
```bash
claude plugin marketplace add tw93/waza
claude plugin install write@waza
```
