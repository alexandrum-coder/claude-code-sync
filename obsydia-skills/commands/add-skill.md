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

## 7. Report to the user
Tell them, concisely:
- ✅ `<name>` added, synced, committed, and pushed.
- To see it in the desktop app: **fully restart** it (quit via the system tray,
  not just close the window — a new tab/session will NOT reload the plugin).
- On OTHER devices: `git pull`, then
  `claude plugin update obsydia-skills@obsydia`, then full restart.
