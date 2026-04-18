#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

python3 - <<'PYEOF'
import json
import sys
from pathlib import Path


def fail(message: str) -> None:
    print(message, file=sys.stderr)
    raise SystemExit(1)


def parse_frontmatter(path: Path) -> dict[str, str]:
    lines = path.read_text().splitlines()
    if not lines or lines[0] != "---":
        fail(f"INVALID FRONTMATTER: {path} must start with ---")

    try:
        end = lines.index("---", 1)
    except ValueError:
        fail(f"INVALID FRONTMATTER: {path} missing closing ---")

    frontmatter = lines[1:end]
    fields: dict[str, str] = {}
    in_metadata = False

    for line in frontmatter:
        if line.startswith("name:"):
            fields["name"] = line.split(":", 1)[1].strip()
            in_metadata = False
        elif line.startswith("description:"):
            raw_value = line.split(":", 1)[1].strip()
            if not raw_value.startswith('"') and ": " in raw_value:
                fail(
                    f"UNQUOTED DESCRIPTION WITH COLON: {path}\n"
                    f"  Description contains ': ' and must be wrapped in double quotes, "
                    f"otherwise YAML plain-scalar parsing truncates the field."
                )
            fields["description"] = raw_value.strip('"')
            in_metadata = False
        elif line == "metadata:":
            in_metadata = True
        elif in_metadata and line.startswith("  version:"):
            fields["version"] = line.split(":", 1)[1].strip().strip('"')
        elif line and not line.startswith(" "):
            in_metadata = False

    for field in ("name", "description", "version"):
        if not fields.get(field):
            fail(f"MISSING {field}: in {path}")

    return fields


root = Path(".")
skill_files = sorted((root / "skills").glob("*/SKILL.md"))
if not skill_files:
    fail("NO SKILLS FOUND: expected skills/*/SKILL.md")

skill_versions: dict[str, str] = {}
skill_descriptions: dict[str, str] = {}
for path in skill_files:
    skill_dir = path.parent.name
    fields = parse_frontmatter(path)
    if fields["name"] != skill_dir:
        fail(f"NAME MISMATCH: {path} frontmatter name={fields['name']} dir={skill_dir}")
    skill_versions[skill_dir] = fields["version"]
    skill_descriptions[skill_dir] = fields["description"]
    print(f"ok: {path.as_posix()}")

marketplace = json.load(open(root / "marketplace.json"))
plugins = marketplace.get("plugins")
if not isinstance(plugins, list):
    fail("INVALID MARKETPLACE: plugins must be a list")

market_versions: dict[str, str] = {}
market_descriptions: dict[str, str] = {}
for entry in plugins:
    if not isinstance(entry, dict):
        fail("INVALID MARKETPLACE: plugin entry must be an object")
    name = entry.get("name")
    version = entry.get("version")
    source = entry.get("source")
    description = entry.get("description", "").strip().strip('"')
    if not name or not version:
        fail("INVALID MARKETPLACE: every plugin needs name and version")
    if not description:
        fail(f"MISSING DESCRIPTION: marketplace plugin {name}")
    if name in market_versions:
        fail(f"DUPLICATE MARKETPLACE ENTRY: {name}")
    expected_source = f"./skills/{name}"
    if source != expected_source:
        fail(f"WRONG SOURCE: {name} source={source!r} expected={expected_source!r}")
    market_versions[name] = version
    market_descriptions[name] = description

missing_from_market = sorted(set(skill_versions) - set(market_versions))
if missing_from_market:
    fail("NOT IN MARKETPLACE: " + ", ".join(missing_from_market))

extra_in_market = sorted(set(market_versions) - set(skill_versions))
if extra_in_market:
    fail("MISSING SKILL DIRECTORY: " + ", ".join(extra_in_market))

for skill, skill_version in sorted(skill_versions.items()):
    market_version = market_versions[skill]
    if skill_version != market_version:
        fail(f"VERSION MISMATCH: {skill} SKILL={skill_version} MARKET={market_version}")
    if skill_descriptions[skill] != market_descriptions[skill]:
        fail(
            f"DESCRIPTION MISMATCH: {skill}\n"
            f"  SKILL.md:    {skill_descriptions[skill]}\n"
            f"  marketplace: {market_descriptions[skill]}"
        )
    print(f"ok: {skill} {skill_version}")

import re
# Direct local references: `references/foo.md`, `agents/bar.md`, `scripts/baz.sh`
# Lookbehind excludes absolute path fragments like $HOME/.agents/skills/X
ref_pattern = re.compile(r'(?<![/.])\b(?:references|agents|scripts)/[\w/.-]+\b')
# Script references via runtime variable: ${SKILL_DIR}/scripts/foo.sh
script_pattern = re.compile(r'\}/scripts/([\w/.-]+)')
for path in skill_files:
    skill_dir = path.parent.name
    text = path.read_text()
    refs = set(ref_pattern.findall(text))
    refs |= {"scripts/" + s for s in script_pattern.findall(text)}
    for ref in sorted(refs):
        expected = root / "skills" / skill_dir / ref
        if not expected.exists():
            fail(f"BROKEN REFERENCE: {path} references {ref} but file does not exist")
        print(f"ok: reference {skill_dir}/{ref}")
PYEOF

# Reference files exist for skills that use them
test -f skills/design/references/design-reference.md && \
test -f skills/read/references/read-methods.md && \
test -f skills/write/references/write-zh.md && \
test -f skills/write/references/write-en.md && \
test -f skills/health/agents/inspector-context.md && \
test -f skills/health/agents/inspector-control.md && \
test -f skills/check/agents/reviewer-security.md && \
test -f skills/check/agents/reviewer-architecture.md && \
test -f skills/check/references/persona-catalog.md && \
test -f rules/english.md && echo "references: ok"
