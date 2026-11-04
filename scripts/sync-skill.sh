#!/usr/bin/env bash
# Copy this skill into the skills directory of every agent host you use.
# Edit TARGETS to match your machine, then: bash scripts/sync-skill.sh
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NAME="groundwork"

TARGETS=(
  "$HOME/.claude/skills"            # Claude Code
  "$HOME/.agents/skills"            # agentskills / Codebuff / Freebuff
  "$HOME/.codex/skills"             # Codex
  "$HOME/.config/opencode/skills"   # OpenCode
)

if [ ! -f "$HERE/SKILL.md" ]; then
  echo "ERROR: SKILL.md not found in $HERE" >&2
  exit 1
fi

for d in "${TARGETS[@]}"; do
  mkdir -p "$d"
  rm -rf "${d:?}/$NAME"
  cp -r "$HERE" "$d/$NAME"
  # keep the copy clean of VCS metadata and this script's own nesting
  rm -rf "$d/$NAME/.git"
  printf "  OK  %s/%s\n" "$d" "$NAME"
done

echo
echo "Done. Restart the agent sessions to reload the skill."
