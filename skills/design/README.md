# /design

Build frontend interfaces with a committed aesthetic direction. Not generic AI output.

## Usage

Type `/design` when building a UI. Describe the screen or component. Claude will name and commit to a specific visual direction before writing a single line of code.

## Core Method

- Lock the direction first: name the aesthetic precisely (dense editorial, brutalist grid, warm analog, etc.) before any markup
- Typography: pair one display font with one text font. Do not use Inter, Roboto, or system-ui as the display typeface
- Color: build a system with CSS variables, not a collection of hex values
- Motion: one coordinated entrance beats ten scattered hover states
- Layout: controlled asymmetry and spatial choice, not split-the-difference defaults
- Common traps: purple gradients, three-part hero, identical card grids, default nav layout -- none of these by accident
- Tech stack: name one CSS strategy (Tailwind only, CSS Modules only, or CSS-in-JS only) and do not mix

## Handoff

Ends with the aesthetic direction justified in 2-3 sentences, non-obvious choices explained, and instructions for replacing placeholder content.

## Install

```bash
npx skills add tw93/Waza -a claude-code -s design -y
```
