#!/bin/bash
# ============================================================================
# skills-push.sh
# ----------------------------------------------------------------------------
# One command for "I added or changed a skill, now update both environments".
#
#   bash skills-push.sh 1.4.0 "add skill foo"
#
# Two environments load these skills, and they are NOT the same copy:
#   * Claude Code  -> the local directory marketplace (this repo), updated here.
#   * Cowork       -> a ZIP uploaded to the account. The account copy is served
#                     to the desktop app at every start and ALWAYS WINS over the
#                     local one. If it is stale, the old skill set reappears on
#                     every restart no matter what you do locally.
#
# Because of that, this script refuses to publish a new version while the
# previous one is still missing from the account. The last version confirmed
# uploaded is recorded in .account-version; you confirm an upload with:
#
#   bash skills-push.sh --mark-uploaded <version>
#
# Steps, stopping at the first failure:
#   0. Verifies the account copy is in sync with the local plugin
#   1. Validates the YAML frontmatter of every skill in custom-skills/
#   2. Runs sync-skills-to-plugin.sh (regenerates obsydia-skills/skills/)
#   3. Writes the new version into obsydia-skills/.claude-plugin/plugin.json
#   4. git add -A, commit, push
#   5. claude plugin update obsydia-skills@obsydia   -> updates Claude Code
#   6. Builds the upload zip and validates it against the three rules the
#      Cowork uploader enforces
#
# Pass --no-push to stop after step 3 (dry run).
# Pass --accept-drift to bypass the step-0 gate (new machine, where
# .account-version cannot know what the account really holds).
#
# To rebuild the upload zip for the version already in plugin.json, without
# bumping or committing anything (this is what you need for a one-time
# reconciliation of a stale account copy):
#
#   bash skills-push.sh --build-zip
#
# With .plugin-channel = "local" (the current setup, since 2026-09-26) steps 0
# and 6 change: no account gate and no zip; step 6 checks the app log instead.
#   bash skills-push.sh --check     # did an account copy override the local one?
# ============================================================================

set -euo pipefail

# --- repo is wherever this script lives, never a guessed $HOME path ---------
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN="$REPO/obsydia-skills"
MANIFEST="$PLUGIN/.claude-plugin/plugin.json"
ACCOUNT_STATE="$REPO/.account-version"

# --- delivery channel (decided 2026-09-26) ----------------------------------
# "local": obsydia-skills reaches the desktop app ONLY as the locally installed
# plugin from this repo. No account copy, no zip upload: an account copy with
# the same name silently overrides the local one ("exists in both remote and
# local. Using remote." in the app log), which is what kept serving stale
# versions. Any other value (or no file) restores the old account-upload flow.
CHANNEL="$(tr -d '[:space:]' < "$REPO/.plugin-channel" 2>/dev/null || true)"

# Scans the desktop app log for the last session start and reports whether an
# account copy of obsydia-skills overrode the local one there.
check_override() {
  local log=""
  for f in "$HOME/Library/Logs/Claude/main.log" \
           "${APPDATA:-/nonexistent}/Claude/logs/main.log" \
           "${LOCALAPPDATA:-/nonexistent}"/Packages/Claude_*/LocalCache/Roaming/Claude/logs/main.log; do
    [ -f "$f" ] && { log="$f"; break; }
  done
  if [ -z "$log" ]; then echo "    (app log not found; cannot check for an account copy)"; return 0; fi
  "$PY" - "$log" <<'PYEOF'
import sys
lines = open(sys.argv[1], encoding="utf-8", errors="replace").read().splitlines()
starts = [i for i, l in enumerate(lines) if "plugin(s) to SDK" in l]
if not starts:
    print("    (no session start in the app log yet)"); sys.exit(0)
last = starts[-1]
block = lines[max(0, last - 80):last + 1]
hit = [l for l in block if '"obsydia-skills@obsydia" exists in both remote and local' in l]
when = lines[last][:19]
if hit:
    print(f"    WARN - at the last app start ({when}) an ACCOUNT copy of obsydia-skills")
    print("           overrode the local one. Remove every obsydia-skills entry from")
    print("           Customize -> Plugins (and any claude-code-sync marketplace linked")
    print("           to the account), then quit the app fully and reopen.")
    sys.exit(3)
print(f"    OK - at the last app start ({when}) no account copy overrode the local plugin")
PYEOF
}

# --- a Python that actually runs (python3 is a Store stub on Windows) -------
PY=""
for c in python3 python py; do
  if command -v "$c" >/dev/null 2>&1 && "$c" -c "import sys" >/dev/null 2>&1; then
    PY="$c"; break
  fi
done
[ -n "$PY" ] || { echo "FAIL: no working Python found (tried python3, python, py)"; exit 2; }

# --- Desktop, wherever OneDrive put it -------------------------------------
DESKTOP=""
for d in "${USERPROFILE:-$HOME}/OneDrive/Desktop" "${USERPROFILE:-$HOME}/Desktop" "$HOME/Desktop"; do
  [ -d "$d" ] && { DESKTOP="$d"; break; }
done
[ -n "$DESKTOP" ] || DESKTOP="$REPO"

# --- mode: confirm an upload happened --------------------------------------
if [ "${1:-}" = "--check" ]; then
  echo "==> Checking the last desktop-app start for an account copy of obsydia-skills"
  check_override; exit $?
fi

if [ "${1:-}" = "--mark-uploaded" ]; then
  MV="${2:-}"
  if ! printf '%s' "$MV" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$'; then
    echo "Usage: bash skills-push.sh --mark-uploaded <version>"; exit 2
  fi
  printf '%s\n' "$MV" > "$ACCOUNT_STATE"
  echo "Recorded: the Cowork account copy is now at $MV"
  echo "Next publish is unblocked."
  exit 0
fi

VERSION="${1:-}"
MESSAGE="${2:-}"
PUSH=1
ACCEPT_DRIFT=0
BUILD_ONLY=0
for arg in "$@"; do
  [ "$arg" = "--no-push" ] && PUSH=0
  [ "$arg" = "--accept-drift" ] && ACCEPT_DRIFT=1
  [ "$arg" = "--build-zip" ] && BUILD_ONLY=1
done

if [ "$BUILD_ONLY" -eq 0 ] && { [ -z "$VERSION" ] || [ -z "$MESSAGE" ]; }; then
  echo "Usage: bash skills-push.sh <version> \"<commit message>\" [--no-push] [--accept-drift]"
  echo "       bash skills-push.sh --build-zip"
  echo "       bash skills-push.sh --mark-uploaded <version>"
  exit 2
fi

if [ "$BUILD_ONLY" -eq 0 ] && ! printf '%s' "$VERSION" | grep -Eq '^[0-9]+\.[0-9]+\.[0-9]+$'; then
  echo "FAIL: version must look like 1.3.0, got '$VERSION'"; exit 2
fi

if [ ! -f "$MANIFEST" ]; then
  echo "FAIL: no plugin manifest at $MANIFEST"
  echo "      Is $REPO the right repo? This script uses its own location, so"
  echo "      run the copy that lives inside the marketplace repo."
  exit 2
fi

CURRENT=$("$PY" -c "import json,sys;print(json.load(open(sys.argv[1]))['version'])" "$MANIFEST")

if [ "$BUILD_ONLY" -eq 1 ]; then
  VERSION="$CURRENT"
elif [ "$CURRENT" = "$VERSION" ]; then
  echo "FAIL: plugin.json is already at $VERSION. A new skill needs a minor bump."
  echo "      To rebuild the zip for $CURRENT without bumping: bash skills-push.sh --build-zip"
  exit 2
fi

ZIP="$DESKTOP/obsydia-skills-$VERSION.zip"

ACCOUNT_V="unknown"
if [ -f "$ACCOUNT_STATE" ]; then
  ACCOUNT_V="$(tr -d '[:space:]' < "$ACCOUNT_STATE")"
  [ -n "$ACCOUNT_V" ] || ACCOUNT_V="unknown"
fi

if [ "$BUILD_ONLY" -eq 1 ]; then
  echo "==> --build-zip: packaging the current version ($CURRENT), no bump, no commit"
else

# --- 0. account gate -------------------------------------------------------
echo "==> 0/6  Checking the Cowork account copy"
if [ "$CHANNEL" = "local" ]; then
  echo "    SKIP - channel is 'local' (.plugin-channel); no account copy is used"
elif [ "$ACCOUNT_V" = "$CURRENT" ]; then
  echo "    OK - account and local plugin are both at $CURRENT"
elif [ "$ACCEPT_DRIFT" -eq 1 ]; then
  echo "    WARN - account at '$ACCOUNT_V', local at '$CURRENT'; continuing (--accept-drift)"
else
  echo "FAIL: the Cowork account copy is at '$ACCOUNT_V' but the local plugin is at '$CURRENT'."
  echo ""
  echo "  The account copy is served to the desktop app at every start and always"
  echo "  overrides the local one. Publishing $VERSION now would only widen the gap:"
  echo "  Claude Code would get $VERSION while Cowork keeps serving '$ACCOUNT_V'."
  echo ""
  echo "  The account can serve obsydia-skills from TWO places, and they compete:"
  echo "    (a) the remote 'claude-code-sync' marketplace linked to the GitHub repo"
  echo "        - it caches a snapshot and does NOT re-pull on its own"
  echo "    (b) 'My Uploads' - a ZIP you upload by hand"
  echo "  If both exist you get two entries and the older one keeps winning."
  echo ""
  echo "  Fix it in this order:"
  echo "    1. Build the zip:  bash skills-push.sh --build-zip"
  echo "       (or reuse $DESKTOP/obsydia-skills-$CURRENT.zip if still there)"
  echo "    2. Cowork -> Customize -> Plugins: REMOVE every obsydia-skills entry,"
  echo "       including the one whose source is the claude-code-sync marketplace"
  echo "    3. Upload the zip, so the only copy left comes from My Uploads"
  echo "    4. Quit the app completely (system tray), reopen"
  echo "    5. bash skills-push.sh --mark-uploaded $CURRENT"
  echo ""
  echo "  Then re-run this command. Override with --accept-drift only if you know"
  echo "  the account copy really is current."
  exit 1
fi

# --- 1. frontmatter --------------------------------------------------------
echo "==> 1/6  Validating frontmatter in custom-skills/"
"$PY" - "$REPO" <<'PYEOF'
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
    # skill is an unquoted scalar containing ": " - safe_load above catches that.
    if not (meta or {}).get("description"):
        problems.append(f"{p}: missing description")
if problems:
    print("FAIL:")
    for line in problems:
        print("   ", line)
    sys.exit(1)
print("    OK")
PYEOF

# --- 2. sync ---------------------------------------------------------------
echo "==> 2/6  Syncing custom-skills/ into obsydia-skills/skills/"
SYNC_OUT=$(bash "$REPO/sync-skills-to-plugin.sh")
printf '%s\n' "$SYNC_OUT" | sed 's/^/    /'
if printf '%s' "$SYNC_OUT" | grep -q "WARN"; then
  echo "FAIL: sync reported a WARN. Fix it before publishing."
  exit 1
fi

# --- 3. version ------------------------------------------------------------
echo "==> 3/6  Setting plugin.json to $VERSION (was $CURRENT)"
"$PY" - "$MANIFEST" "$VERSION" <<'PYEOF'
import json, sys
path, version = sys.argv[1], sys.argv[2]
data = json.load(open(path))
data["version"] = version
with open(path, "w") as fh:
    json.dump(data, fh, indent=2)
    fh.write("\n")
PYEOF

if [ "$PUSH" -eq 0 ]; then
  echo "==> --no-push: stopping before commit. Review with: git -C \"$REPO\" status"
  echo "    (plugin.json now says $VERSION, but nothing is committed)"
  exit 0
fi

# --- 4. commit + push ------------------------------------------------------
echo "==> 4/6  Commit and push"
git -C "$REPO" add -A
git -C "$REPO" commit -q -m "v$VERSION - $MESSAGE"
git -C "$REPO" push -q
echo "    $(git -C "$REPO" log --oneline -1)"

# --- 5. Claude Code --------------------------------------------------------
echo "==> 5/6  Updating the Claude Code plugin"
claude plugin marketplace update obsydia || echo "    (non-fatal) run it yourself later"
claude plugin update obsydia-skills@obsydia || echo "    (non-fatal) run it yourself later"

if [ "$CHANNEL" = "local" ]; then
  echo "==> 6/6  Checking that no account copy overrides the local plugin"
  check_override || true
  echo ""
  echo "Done. Quit the desktop app completely and reopen it to load $VERSION."
  echo "On the other machine: git pull, then update the plugin"
  echo "  (Windows: powershell -ExecutionPolicy Bypass -File .\\windows\\setup-windows.ps1 -Update)."
  echo "After the restart, confirm with: bash skills-push.sh --check"
  exit 0
fi

fi  # end of the full-publish path skipped by --build-zip

# --- 6. upload zip ---------------------------------------------------------
# The uploader rejects: paths with characters outside [A-Za-z0-9._-/]; any
# nested SKILL.md without frontmatter; duplicate skill names. All three come
# from vendored projects (browser-harness, graphify) whose files are read at
# runtime and must NOT be deleted at source - so they are stripped from a
# staging copy here, never from the repo.
echo "==> 6/6  Building the upload zip"
rm -f "$ZIP"
STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT
mkdir -p "$STAGE/pkg"
cp -r "$PLUGIN/.claude-plugin" "$STAGE/pkg/"
cp -r "$PLUGIN/commands" "$STAGE/pkg/"
cp -r "$PLUGIN/skills" "$STAGE/pkg/"
rm -rf "$STAGE/pkg/skills/graphify/tests"
rm -rf "$STAGE/pkg/skills/graphify/tools/skillgen/expected"
rm -rf "$STAGE/pkg/skills/browser-harness/skills"
rm -f  "$STAGE/pkg/skills/graphify/graphify/skill.md"
rm -f  "$STAGE/pkg/skills/browser-harness/src/browser_harness/SKILL.md"
find "$STAGE/pkg" -name '.DS_Store' -delete

if command -v zip >/dev/null 2>&1; then
  ( cd "$STAGE/pkg" && zip -qr "$ZIP" . )
else
  # No zip in Git Bash on Windows -> fall back to PowerShell's Compress-Archive.
  WIN_SRC="$(cd "$STAGE/pkg" && pwd -W 2>/dev/null || printf '%s' "$STAGE/pkg")"
  WIN_DIR="$(cd "$(dirname "$ZIP")" && pwd -W 2>/dev/null || dirname "$ZIP")"
  WIN_ZIP="$WIN_DIR/$(basename "$ZIP")"
  powershell -NoProfile -Command "Compress-Archive -Path '$WIN_SRC/*' -DestinationPath '$WIN_ZIP' -Force" \
    || { echo "FAIL: no 'zip' command and Compress-Archive failed"; exit 1; }
fi
[ -f "$ZIP" ] || { echo "FAIL: zip not created at $ZIP"; exit 1; }

"$PY" - "$ZIP" "$VERSION" <<'PYEOF'
import sys, zipfile, re, json
path, version = sys.argv[1], sys.argv[2]
z = zipfile.ZipFile(path)
names = [n for n in z.namelist() if not n.endswith("/")]
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

manifest_version = json.loads(z.read(".claude-plugin/plugin.json"))["version"]
if manifest_version != version:
    problems.append(f"plugin.json says {manifest_version}, expected {version}")

if problems:
    print("FAIL: the zip would be rejected -")
    for line in problems:
        print("   ", line)
    sys.exit(1)

print(f"    OK - {len(skill_files)} skills, version {manifest_version}")
print("    " + ", ".join(sorted(folders)))
PYEOF

echo ""
echo "Done. Claude Code is up to date."
echo ""
echo "Cowork is NOT - and until it is, its stale copy keeps overriding this one:"
echo "  1. Customize -> Plugins -> remove obsydia-skills, then upload:"
echo "       $ZIP"
echo "  2. Quit the app completely (system tray, not just the window), reopen"
echo "  3. Record it, so the next publish is unblocked:"
echo "       bash skills-push.sh --mark-uploaded $VERSION"
echo ""
echo "Verify what Claude Code actually loaded:"
echo "  ls ~/.claude/plugins/cache/obsydia/obsydia-skills/*/skills | wc -l"
