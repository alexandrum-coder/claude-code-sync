#!/bin/bash
# ============================================================================
# sync-skills-to-plugin.sh
# ----------------------------------------------------------------------------
# Mirrors every skill in custom-skills/ into the installable plugin at
# obsydia-skills/skills/, so the Claude desktop app (which loads skills via the
# plugin/marketplace system, NOT ~/.claude/skills/user) always has the same set
# the Claude Code CLI sees.
#
# Run this whenever you add, remove, or edit a skill in custom-skills/.
# Cross-platform: works in Git Bash on Windows and in Terminal on macOS.
#
# Detection rules (auto-handles future skills, no edits needed):
#   * custom-skills/<name>/SKILL.md exists -> <name> IS the skill. Take it whole,
#     do NOT descend into it (a skill's own internal skills//src/ folders are
#     implementation detail, e.g. browser-harness).
#   * custom-skills/<name>/ has NO top-level SKILL.md -> it's a vendored project;
#     take each nested custom-skills/<name>/skills/<sub>/SKILL.md as skill <sub>
#     (covers design-extract, whose real skill is skills/extract-design).
#
# The plugin skills/ folder is rebuilt from scratch each run, so deletions and
# renames in custom-skills/ propagate correctly (add / update / remove).
# ============================================================================
set -euo pipefail

# Resolve repo root = the directory this script lives in.
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$REPO/custom-skills"
DEST="$REPO/obsydia-skills/skills"

if [ ! -d "$SRC" ]; then
  echo "ERROR: source not found: $SRC" >&2
  exit 1
fi

echo "Syncing skills:  $SRC  ->  $DEST"
rm -rf "$DEST"
mkdir -p "$DEST"

count=0
skip=0
add_skill() {  # $1 = source skill dir
  local skilldir="$1" name
  name="$(basename "$skilldir")"
  if [ -e "$DEST/$name" ]; then
    echo "  WARN: duplicate skill name '$name' — skipping ($skilldir)" >&2
    skip=$((skip+1)); return
  fi
  cp -r "$skilldir" "$DEST/$name"
  echo "  + $name"
  count=$((count+1))
}

for d in "$SRC"/*/; do
  d="${d%/}"
  if [ -f "$d/SKILL.md" ]; then
    # Direct skill: take the whole folder, do not descend into it.
    add_skill "$d"
  elif [ -d "$d/skills" ]; then
    # Vendored project: take each nested skill under its skills/ folder.
    for sub in "$d/skills"/*/; do
      [ -f "${sub%/}/SKILL.md" ] && add_skill "${sub%/}"
    done
  else
    echo "  WARN: '$(basename "$d")' has no SKILL.md and no skills/ subdir — skipping" >&2
    skip=$((skip+1))
  fi
done

echo ""
echo "Done: $count skill(s) synced into the plugin"$([ "$skip" -gt 0 ] && echo ", $skip skipped")"."
echo "Next: commit + push the repo, then refresh the installed plugin with the"
echo "standalone CLI (the desktop app's /plugin command is disabled in-app):"
echo "  claude plugin update obsydia-skills@obsydia"
echo "Then FULLY restart the desktop app (quit via system tray) so it reloads."
