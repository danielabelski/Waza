# /learn

Deep research structured like engineering work. From raw materials to published output in six phases.

## Usage

Type `/learn` when diving into an unfamiliar domain or preparing to write a research article. Not for quick lookups or single-file reads.

## Three entry modes

| Mode | When | Where you exit |
|:---|:---|:---|
| Deep Research | Understand a domain well enough to write about it | Phase 6: publish |
| Quick Reference | Build a working mental model fast, no article planned | Phase 2: cut and keep notes |
| Write to Learn | Already have materials, want to force understanding through writing | Phase 3: outline |

## Six phases

1. **Collect**: gather primary sources, raw materials, reference implementations
2. **Digest**: read, annotate, cut half of what you collected
3. **Outline**: write the article structure, source each section
4. **Fill in**: work through the outline section by section, get a full draft down
5. **Refine with AI**: hand the draft to Claude with a specific brief, review every suggestion yourself
6. **Self-review and publish**: read front to back, fix what does not hold up, then publish

Claude's role: research assistant, sounding board, editor. The writing is yours.

## Red lines

- Do not let Claude write sections from scratch. Fill them in yourself, then refine.
- Do not skip Phase 6 because "AI already reviewed it." AI checks fluency. You check truth.

## Install

```bash
npx skills add tw93/Waza -a claude-code -s learn -y
```
