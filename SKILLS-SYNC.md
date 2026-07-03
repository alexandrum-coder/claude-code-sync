# Skills sync — how personal skills reach each surface

This repo delivers custom skills to **two different Claude surfaces**, which use
two different discovery mechanisms. Adding a skill means making sure it reaches
both.

## The two surfaces

| Surface | How it finds skills | Location |
|---|---|---|
| **Claude Code CLI** (real terminal, `claude`) | scans a user skills folder | symlinks in `~/.claude/skills/user/` → this repo's `custom-skills/` |
| **Claude desktop app** ("Code" tab / Cowork) | plugin + marketplace system (does **not** scan `~/.claude/skills/user`) | the `obsydia-skills` plugin in this repo, installed via the `obsydia` marketplace |

`custom-skills/` is the **source of truth**. `obsydia-skills/skills/` is a
generated mirror for the desktop app — never edit it by hand.

## Repo layout

```
.claude-plugin/marketplace.json   # declares the "obsydia" marketplace
obsydia-skills/                    # the installable plugin (desktop app)
  .claude-plugin/plugin.json
  skills/                          # GENERATED mirror of custom-skills (do not edit)
custom-skills/                     # SOURCE OF TRUTH — add/edit skills here
sync-skills-to-plugin.sh          # regenerates obsydia-skills/skills from custom-skills
```

## Adding / editing / removing a personal skill

1. Add, edit, or delete the skill under `custom-skills/` (as usual).
2. Regenerate the plugin mirror:
   ```bash
   bash sync-skills-to-plugin.sh
   ```
3. Commit + push the repo.
4. On each device, pull, then refresh the installed plugin. NOTE: the desktop
   app's embedded Code tab has `/plugin` DISABLED — use the standalone bundled
   CLI instead (Windows path shown; on macOS use the app's `claude` binary):
   ```
   # Windows bundled CLI:
   & "C:\Users\<you>\AppData\Roaming\Claude\claude-code\<version>\claude.exe" plugin update obsydia-skills@obsydia
   ```
   First-time install on a new device:
   ```
   <claude.exe> plugin marketplace add "<path-to-this-repo>"
   <claude.exe> plugin install obsydia-skills@obsydia
   ```
   **Then FULLY restart the desktop app** (quit via system tray, relaunch) — a
   new session/tab alone does NOT reload the plugin registry.
   - **CLI-in-a-real-terminal users** can also just use the loose-folder linker
     (`link_skills_windows_SAFE.ps1` / `link_skills_mac.sh`); that path only
     feeds the terminal CLI, not the desktop app.

## Detection rules used by the sync script (so future skills "just work")

- A `custom-skills/<name>/` folder that has its own `SKILL.md` is taken whole as
  one skill — its internal `skills/` or `src/` folders are ignored
  (e.g. `browser-harness`).
- A `custom-skills/<name>/` folder with **no** top-level `SKILL.md` is treated as
  a vendored project: each skill under its nested `skills/<sub>/SKILL.md` is
  pulled out individually (e.g. `design-extract` → `extract-design`).
- The plugin `skills/` folder is rebuilt from scratch each run, so additions,
  edits, renames, and deletions all propagate.
