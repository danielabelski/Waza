# /write

Strip AI writing patterns and enforce natural voice. Works in Chinese and English.

## Usage

Type `/write` when editing prose: blog posts, docs, emails, announcements. Not for code comments, commit messages, or inline documentation.

## Core Method

- Detects the content language and loads the matching rules file
- Chinese rules: no "首先/其次/最后" scaffolding, no "值得注意的是", no abstract noun pileups
- English rules: no "It's worth noting", no "In conclusion", no em dashes, no over-hedging
- Sentence rhythm: vary length deliberately, concrete details over abstractions
- `disable-model-invocation: true` prevents the skill from triggering itself recursively

## Install

```bash
npx skills add tw93/Waza -a claude-code -s write -y
```
