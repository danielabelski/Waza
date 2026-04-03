# /design

Build frontend interfaces with a committed aesthetic direction. No generic AI output.

## Usage

Type `/design` when building a UI. Describe the screen or component -- Claude will commit to a specific visual direction before writing code.

## Core Method

- Aesthetic commitment: choose a direction (editorial, brutalist, spatial, etc.) before any markup
- Anti-pattern list: no purple gradients, no hero section formula, no Inter/Roboto/Arial defaults
- Distinctive color palette, intentional whitespace, custom motion
- Layout-first: structure and spacing before color and decoration
- Designed to be used after `/think` approval for frontend work

## Install

Single skill:
```bash
claude plugin marketplace add tw93/waza
claude plugin install design@waza
```
