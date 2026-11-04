#!/usr/bin/env bash
# Validate the Groundwork skill against its own format contract.
# Usage: bash scripts/validate-skill.sh [skill-dir]
# Exit code 0 = pass, 1 = at least one failure.
set -uo pipefail

DIR="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
NAME="$(basename "$DIR")"
FAIL=0

ok()   { printf "  ok    %s\n" "$1"; }
fail() { printf "  FAIL  %s\n" "$1"; FAIL=$((FAIL+1)); }

echo "Validating: $DIR"
echo

# 1. SKILL.md exists
if [ -f "$DIR/SKILL.md" ]; then ok "SKILL.md present"; else fail "SKILL.md missing"; echo; echo "FAILED ($FAIL)"; exit 1; fi

# 2. Frontmatter, name == directory name
if head -1 "$DIR/SKILL.md" | grep -q '^---$'; then ok "frontmatter opens on line 1"; else fail "frontmatter must open on line 1"; fi

FM_NAME="$(sed -n '1,/^---$/p' "$DIR/SKILL.md" | sed -n '2,$p' | grep -m1 '^name:' | sed 's/^name:[[:space:]]*//;s/[[:space:]]*$//')"
if [ "$FM_NAME" = "$NAME" ]; then ok "name '$FM_NAME' matches directory"; else fail "name '${FM_NAME:-missing}' must equal directory name '$NAME'"; fi

# 3. Description present and sane
DESC="$(sed -n '1,/^---$/p' "$DIR/SKILL.md" | sed -n '2,$p' | grep -m1 '^description:' | sed 's/^description:[[:space:]]*//')"
if [ -z "$DESC" ]; then
  fail "description missing"
elif [ "${#DESC}" -gt 1024 ]; then
  fail "description is ${#DESC} chars (max 1024)"
else
  ok "description present (${#DESC} chars)"
fi

# 4. Every referenced file exists
MISSING=0
for ref in $(grep -oE 'references/[A-Za-z0-9._-]+\.md' "$DIR/SKILL.md" | sort -u); do
  [ -f "$DIR/$ref" ] || { fail "referenced but missing: $ref"; MISSING=$((MISSING+1)); }
done
[ "$MISSING" -eq 0 ] && ok "all referenced files exist"

# 5. Orphan reference files
ORPHAN=0
if [ -d "$DIR/references" ]; then
  for f in "$DIR"/references/*.md; do
    [ -e "$f" ] || continue
    rel="references/$(basename "$f")"
    grep -q "$rel" "$DIR/SKILL.md" || { fail "not referenced from SKILL.md: $rel"; ORPHAN=$((ORPHAN+1)); }
  done
fi
[ "$ORPHAN" -eq 0 ] && ok "no orphan reference files"

# 6. No absolute paths (portability)
ABS="$(grep -rnE '(^|[^A-Za-z0-9._-])([A-Za-z]:[\\/]|/Users/|/home/)' "$DIR"/*.md "$DIR"/references/*.md 2>/dev/null)"
if [ -z "$ABS" ]; then ok "no absolute paths"; else fail "absolute paths found: $(echo "$ABS" | head -3 | tr '\n' ' ')"; fi

# 7. Nine rules present
RULES="$(grep -cE '^[1-9]\. \*\*' "$DIR/SKILL.md")"
if [ "$RULES" -ge 9 ]; then ok "nine numbered rules present"; else fail "found $RULES numbered rules, expected 9"; fi

# 8. SKILL.md stays readable in context
LINES="$(wc -l < "$DIR/SKILL.md")"
if [ "$LINES" -le 200 ]; then ok "SKILL.md is $LINES lines (limit 200)"; else fail "SKILL.md is $LINES lines (limit 200)"; fi

# 9. Obvious secrets
if grep -rqE 'sk-[A-Za-z0-9]{20,}|gh[pousr]_[A-Za-z0-9]{20,}|AKIA[0-9A-Z]{16}' "$DIR" --include='*.md' --include='*.sh' 2>/dev/null; then
  fail "possible secret committed"
else
  ok "no obvious secrets"
fi

# 10. CHANGELOG has an Unreleased section
if [ -f "$DIR/CHANGELOG.md" ] && grep -q '^## \[Unreleased\]' "$DIR/CHANGELOG.md"; then
  ok "CHANGELOG has [Unreleased]"
else
  fail "CHANGELOG.md missing or without [Unreleased] section"
fi

echo
if [ "$FAIL" -eq 0 ]; then echo "PASS"; exit 0; else echo "FAILED ($FAIL)"; exit 1; fi
