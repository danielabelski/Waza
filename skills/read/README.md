# /read

Fetch any URL or PDF as clean Markdown. Routes by platform automatically.

## Usage

Type `/read` followed by a URL or file path. Works with web pages, WeChat public account articles, and PDFs.

## Core Method

- Routing: WeChat (`mp.weixin.qq.com`) uses a local Playwright script; PDFs use local extraction tools; everything else uses the proxy cascade
- Proxy cascade: r.jina.ai first, defuddle.md fallback, local agent-fetch as last resort
- PDF options: `marker` (best quality, layout-aware), `pdftotext` (fast), `pypdf` (no dependencies)
- Output: plain text header (Title, Author, Source, URL) + summary + full Markdown body

## Saving

Saves to `~/Downloads/{title}.md` by default. Skipped only if you say "just preview" or "don't save".

## Install

```bash
npx skills add tw93/Waza -a claude-code -s read -y
```
