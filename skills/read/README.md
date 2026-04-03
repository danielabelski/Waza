# /read

Fetch any URL or PDF as clean Markdown. Routes by platform automatically.

## Usage

Type `/read` followed by a URL or file path. Works with web pages, WeChat articles, Feishu docs, and PDFs.

## Core Method

- Routing: WeChat uses Playwright script, Feishu uses API auth, PDFs use local extraction, everything else uses proxy cascade
- Proxy cascade: r.jina.ai first, defuddle.md fallback, local agent-fetch as last resort
- PDF options: marker (best quality), pdftotext (fast), pypdf (no deps)
- Output: YAML frontmatter + Markdown body, saved to `~/Downloads/{title}.md`

## Install

Single skill:
```bash
claude plugin marketplace add tw93/waza
claude plugin install read@waza
```
