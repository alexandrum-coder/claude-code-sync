---
description: Add a personal skill to the obsydia-skills plugin, then sync, version-bump, commit, and push it everywhere
argument-hint: "[skill-name-in-custom-skills | path-to-a-skill-folder]"
allowed-tools: Bash, Read, Edit, Glob
---

# Add a skill to the obsydia-skills marketplace plugin

Automate the "add a personal skill" workflow for the user's `obsydia-skills`
plugin. The user invoked this with argument: **$ARGUMENTS**

Work through these steps in order. STOP and ask the user if any step fails or if
anything is ambiguous — do not guess or force past errors.

## 1. Locate the repo (REPO)
- Read `~/.claude/plugins/known_marketplaces.json`; find the `obsydia` entry and
  use its `installLocation` (or `source.path`) as REPO.
- If that file/entry is missing, and the current directory is inside a git repo
  that contains `obsydia-skills/.claude-plugin/plugin.json`, use
  `git rev-parse --show-toplevel` as REPO.
- If neither resolves, STOP and tell the user you can't find the obsydia repo.
- Use REPO as the working directory for all file/git operations below.

## 2. Resolve and stage the skill into custom-skills/
Interpret **$ARGUMENTS**:
- **A path** to a folder containing `SKILL.md` (or a vendored project with
  `skills/<x>/SKILL.md`): copy the skill folder into `REPO/custom-skills/<name>`
  (keep the SKILL.md folder's own name).
- **A bare name**: verify `REPO/custom-skills/<name>/SKILL.md` already exists.
- Otherwise STOP and ask which skill is meant.
Confirm the resolved skill folder has a valid `SKILL.md` with `name:` and
`description:` frontmatter. If not, STOP and report.

## 2.5 Sanity-check the description (style, not a hard blocker)
Keep `description` to ONE concise line, ideally under ~900 characters, quoted
with `"..."` if it contains a colon. Long multi-line blocks listing dozens of
individually-quoted trigger phrases are hard to read and add token cost for
zero benefit — condense trigger phrases with `/` instead of separate sentences.
This is a style rule, not the reason a skill fails to load (see step 6.5).

## 3. Regenerate the plugin mirror
- Run `bash "REPO/sync-skills-to-plugin.sh"`.
- Confirm the new skill shows in the `+ ...` output and no unexpected WARN/skip.

## 4. Bump the plugin version (so `plugin update` actually refreshes)
- Read `REPO/obsydia-skills/.claude-plugin/plugin.json`, increment the PATCH
  number of `version` (e.g. `1.1.0` -> `1.1.1`), and write it back.
- A version bump is required — the installer caches by version, so without it a
  refresh will report "already up to date" and the new skill won't appear.

## 5. Commit + push
- In REPO: `git add -A`, then commit with message
  `Add skill <name> to obsydia-skills`, ending the message with:
  `Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>`
- `git push`. If push fails, STOP and show the error.

## 6. Refresh the local install
- If `claude` is on PATH: `claude plugin update obsydia-skills@obsydia`.
- Otherwise use the bundled binary. On Windows it's under
  `%APPDATA%\Claude\claude-code\<version>\claude.exe` — find the version folder,
  then run `<that>.exe plugin update obsydia-skills@obsydia`.
- If update reports no change, reinstall:
  `<claude> plugin install obsydia-skills@obsydia`.

## 6.5 CRITICAL — check whether a REMOTE copy of the plugin overrides the local one
The desktop app can hold TWO copies of `obsydia-skills`: the local one installed
from this git repo, and an account-scoped REMOTE one previously uploaded to
claude.ai. **When both exist, the app silently uses the remote one and ignores
everything local** — the git repo, `~/.claude/plugins/cache/`, `claude plugin
update`, and any number of restarts. Nothing surfaces this in the UI.

Verify before reporting success:

```bash
grep "exists in both remote and local" ~/Library/Logs/Claude/main.log | tail -5
```

- A line reading `Plugin "obsydia-skills@obsydia" exists in both remote and
  local. Using remote.` means the local work will NOT take effect.
- Confirm which version is actually live, and whether it has the new skill:

```bash
find ~/Library/Application\ Support/Claude/local-agent-mode-sessions \
  -maxdepth 5 -type d -name "rpm" -exec sh -c \
  'for p in "$1"/*/; do n=$(python3 -c "import json,sys;print(json.load(open(sys.argv[1]))[\"name\"])" "$p/.claude-plugin/plugin.json" 2>/dev/null); [ "$n" = "obsydia-skills" ] && { echo "$p"; grep \"version\" "$p/.claude-plugin/plugin.json"; ls "$p/skills" | wc -l; }; done' _ {} \;
```

If a stale remote copy is live, the ONLY fix is to re-upload the plugin to the
account (**Customize → Plugins**, upload the zip built in step 6.6) — no CLI
command updates an account-scoped remote plugin. Alternatively delete the remote
copy from the account so the local one wins, at the cost of losing cross-device
sync.

## 6.6 Build an upload-ready zip
So the remote copy can actually be refreshed:

```bash
cd REPO/obsydia-skills && zip -r ~/Desktop/obsydia-skills-<version>.zip . -x "*.DS_Store"
```

The zip must have `.claude-plugin/`, `skills/`, and `commands/` at its ROOT —
that is the layout the app expects (verified against a downloaded remote copy).

## 7. Report to the user
Tell them, concisely:
- ✅ `<name>` added, synced, committed, and pushed.
- Whether a remote copy is overriding local (step 6.5) — if yes, say plainly
  that the skill will NOT appear until they upload the zip in
  **Customize → Plugins**, and give them the zip path.
- To see it in the desktop app: **fully restart** it (quit via the system tray,
  not just close the window — a new tab/session will NOT reload the plugin).
- On OTHER devices: `git pull`, then
  `claude plugin update obsydia-skills@obsydia`, then full restart. If the
  account-scoped remote copy is in use, other devices pick it up automatically
  once uploaded — no git pull needed there.
