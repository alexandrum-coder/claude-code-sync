#!/bin/bash
# ============================================================================
# skills-push.sh
# ----------------------------------------------------------------------------
# One command for "I added or changed a skill, now update both environments".
#
#   bash ~/claude-code-sync/skills-push.sh 1.3.0 "add skill plan-taskmanager"
#
# What it does, stopping at the first failure:
#   1. Validates the YAML frontmatter of every skill in custom-skills/
#   2. Runs sync-skills-to-plugin.sh (regenerates obsydia-skills/skills/)
#   3. Writes the new version into obsydia-skills/.claude-plugin/plugin.json
#   4. git add -A, commit, push
#   5. claude plugin update obsydia-skills@obsydia   -> updates Claude Code
#   6. Builds an upload zip on the Desktop and validates it against the three
#      rules the Cowork plugin uploader enforces
#
# What stays manual (no CLI can do it): uploading the zip in
# Customize -> Plugins, then quitting the app completely.
#
# Pass --no-push to stop after step 3 (useful for a dry run).
# ============================================================================

set -euo pipefail

REPO="$HOME/claude-code-sync"
PLUGIN="$REPO/obsydia-skills"
MANIFEST="$PLUGIN/.claude-plugin/plugin.json"

VERSION="${1:-}"
MESSAGE="${2:-}"
PUSH=1
for arg in "$@"; do [ "$arg" = "--no-push" ] && PUSH=0; done

if [ -z "$VERSION" ] || [ -z "$MESSAGE" ]; then
  echo "Usage: bash skills-push.sh <version> \"<commit message>\" [--no-push]"
  echo "Example: bash skills-push.sh 1.3.0 \"add skill plan-taskmanager\""
  exit 2
fi

if ! printf '%s' "$VERSION" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$'; then
  echo "FAIL: version must look like 1.3.0, got '$VERSION'"
  exit 2
fi

CURRENT=$(python3 -c "import json;print(json.load(open('$MANIFEST'))['version'])")
if [ "$CURRENT" = "$VERSION" ]; then
  echo "FAIL: plugin.json is already at $VERSION. A new skill needs a minor bump."
  exit 2
fi

ZIP="$HOME/Desktop/obsydia-skills-$VERSION.zip"

# --- 1. frontmatter -------------------------------------------------------
echo "==> 1/6  Validating frontmatter in custom-skills/"
python3 - "$REPO" <<'PY'
import sys, pathlib, yaml
repo = pathlib.Path(sys.argv[1])
problems = []
for p in sorted((repo / "custom-skills").glob("*/SKILL.md")):
    text = p.read_text(encoding="utf-8")
    if not text.lstrip().startswith("---"):
        problems.append(f"{p}: does not start with ---")
        continue
    try:
        meta = yaml.safe_load(text.split("---", 2)[1])
    except Exception as exc:
        problems.append(f"{p}: {exc}")
        continue
    name = (meta or {}).get("name")
    if name != p.parent.name:
        problems.append(f"{p}: name '{name}' != folder '{p.parent.name}'")
    # A multi-line description is fine as long as YAML parses it. What breaks a
    # skill is an unquoted scalar containing ": " — safe_load above catches that.
    if not (meta or {}).get("description"):
        problems.append(f"{p}: missing description")
if problems:
    print("FAIL:")
    for line in problems:
        print("   ", line)
    sys.exit(1)
print("    OK")
PY

# --- 2. sync --------------------------------------------------------------
echo "==> 2/6  Syncing custom-skills/ into obsydia-skills/skills/"
SYNC_OUT=$(bash "$REPO/sync-skills-to-plugin.sh")
printf '%s\n' "$SYNC_OUT" | sed 's/^/    /'
if printf '%s' "$SYNC_OUT" | grep -q "WARN"; then
  echo "FAIL: sync reported a WARN. Fix it before publishing."
  exit 1
fi

# --- 3. version -----------------------------------------------------------
echo "==> 3/6  Setting plugin.json to $VERSION (was $CURRENT)"
python3 - "$MANIFEST" "$VERSION" <<'PY'
import json, sys
path, version = sys.argv[1], sys.argv[2]
data = json.load(open(path))
data["version"] = version
with open(path, "w") as fh:
    json.dump(data, fh, indent=2)
    fh.write("\n")
PY

if [ "$PUSH" -eq 0 ]; then
  echo "==> --no-push: stopping before commit. Review with: git -C $REPO status"
  exit 0
fi

# --- 4. commit + push -----------------------------------------------------
echo "==> 4/6  Commit and push"
git -C "$REPO" add -A
git -C "$REPO" commit -q -m "v$VERSION — $MESSAGE"
git -C "$REPO" push -q
echo "    $(git -C "$REPO" log --oneline -1)"

# --- 5. Claude Code -------------------------------------------------------
echo "==> 5/6  Updating the Claude Code plugin"
claude plugin update obsydia-skills@obsydia || echo "    (non-fatal) run it yourself later"

# --- 6. upload zip --------------------------------------------------------
# The uploader rejects: paths with characters outside [A-Za-z0-9._-/]; any
# nested SKILL.md without frontmatter; duplicate skill names. All three come
# from vendored projects (browser-harness, graphify) whose files are read at
# runtime and must NOT be deleted at source — so they are stripped here only.
echo "==> 6/6  Building the upload zip"
rm -f "$ZIP"
( cd "$PLUGIN" && zip -qr "$ZIP" .claude-plugin commands skills \
    -x "*.DS_Store" \
    -x "skills/graphify/tests/*" \
    -x "skills/graphify/graphify/skill.md" \
    -x "skills/graphify/tools/skillgen/expected/*" \
    -x "skills/browser-harness/skills/*" \
    -x "skills/browser-harness/src/browser_harness/SKILL.md" )

python3 - "$ZIP" "$VERSION" <<'PY'
import sys, zipfile, re
path, version = sys.argv[1], sys.argv[2]
z = zipfile.ZipFile(path)
names = z.namelist()
problems = []

bad_chars = [n for n in names if re.search(r"[^A-Za-z0-9._\-/]", n)]
if bad_chars:
    problems.append(f"paths with invalid characters: {bad_chars[:5]}")

skill_files = [n for n in names if n.split("/")[-1].lower() == "skill.md"
               and n.startswith("skills/")]
nested = [n for n in skill_files if n.count("/") > 2]
if nested:
    problems.append(f"nested SKILL.md: {nested}")

no_fm = [n for n in skill_files if not z.read(n).lstrip().startswith(b"---")]
if no_fm:
    problems.append(f"SKILL.md without frontmatter: {no_fm}")

folders = [n.split("/")[1] for n in skill_files]
dupes = {n for n in folders if folders.count(n) > 1}
if dupes:
    problems.append(f"duplicate skill names: {sorted(dupes)}")

manifest_version = __import__("json").loads(z.read(".claude-plugin/plugin.json"))["version"]
if manifest_version != version:
    problems.append(f"plugin.json says {manifest_version}, expected {version}")

if problems:
    print("FAIL: the zip would be rejected —")
    for line in problems:
        print("   ", line)
    sys.exit(1)

print(f"    OK — {len(skill_files)} skills, version {manifest_version}")
print("    " + ", ".join(sorted(folders)))
PY

echo
echo "Done. Claude Code is up to date already."
echo "For Cowork, two manual steps remain:"
echo "  1. Customize -> Plugins -> upload $ZIP"
echo "  2. Quit the app completely (not just the window), then reopen"
echo
echo "Verify what actually loaded:"
echo "  python3 -c \"import json,pathlib,os,time;b=pathlib.Path.home()/'Library/Application Support/Claude';r=[(os.path.getmtime(p),json.load(open(p))['version'],len(list((p.parent.parent/'skills').iterdir()))) for p in b.rglob('.claude-plugin/plugin.json') if json.load(open(p)).get('name')=='obsydia-skills'];print(*[(time.strftime('%H:%M',time.localtime(m)),v,n) for m,v,n in sorted(r)[-2:]],sep=chr(10))\""
echo
echo "Never press Install on obsydia-skills in Customize -> Plugins: it installs"
echo "the account copy through the remote API and that copy always wins over local."
