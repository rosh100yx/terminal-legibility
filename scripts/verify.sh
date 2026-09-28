#!/usr/bin/env bash
# Validate the SKILL.md frontmatter against the Agent Skills naming rules.
# Run by `npm run verify` / `prepublishOnly` before every publish. Read-only.
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL="$DIR/SKILL.md"
DIRNAME="$(basename "$DIR")"

fail() { echo "verify FAIL: $1" >&2; exit 1; }

[ -f "$SKILL" ] || fail "SKILL.md not found"

name="$(sed -n 's/^name:[[:space:]]*\([a-z0-9-]*\).*/\1/p' "$SKILL" | head -1)"

[ -n "$name" ] || fail "missing 'name' in frontmatter"
[ "$name" = "$DIRNAME" ] || fail "name '$name' != directory '$DIRNAME'"
[[ "$name" =~ ^[a-z0-9-]{1,64}$ ]] || fail "invalid name '$name' (only a-z, 0-9, hyphens; 1-64 chars)"
[[ "$name" == -* ]]   && fail "name '$name' must not start with a hyphen"
[[ "$name" == *- ]]   && fail "name '$name' must not end with a hyphen"
[[ "$name" == *--* ]] && fail "name '$name' must not contain consecutive hyphens"

grep -q '^description:' "$SKILL" || fail "missing 'description' in frontmatter"

lines="$(wc -l < "$SKILL")"
[ "$lines" -le 500 ] || echo "verify warn: SKILL.md is $lines lines (<=500 recommended)"

echo "verify OK: $name"
