# obsydia-skills — exact install & update commands

The desktop app loads custom skills as an **installed plugin** (not from loose
`~/.claude/skills/user`). The app's own `/plugin` command is disabled inside the
embedded Code tab, so you run the **bundled `claude` binary** from a normal
terminal. Commands below resolve that binary automatically (its version folder
changes over time, so don't hardcode it).

> After ANY install/update below, **fully restart the desktop app** — quit it
> completely (Windows: via the system tray; macOS: `Cmd+Q`), then relaunch.
> A new tab/session alone does NOT reload plugins.

---

## Windows 11 (x64) — PowerShell

```powershell
# 1. Resolve the bundled claude.exe (latest installed version)
$claude = Get-ChildItem "$env:APPDATA\Claude\claude-code" -Directory |
  Sort-Object { [version]$_.Name } -Descending |
  Select-Object -First 1 -ExpandProperty FullName |
  ForEach-Object { Join-Path $_ "claude.exe" }
"Using: $claude"

# 2a. FIRST-TIME INSTALL  (edit the path to your local clone)
& $claude plugin marketplace add "D:\Claude Projects - Obsydia\claude-code-sync"
& $claude plugin install obsydia-skills@obsydia

# 2b. UPDATE after a `git pull` brought new/updated skills
& $claude plugin marketplace update obsydia
& $claude plugin update obsydia-skills@obsydia

# then fully restart the desktop app (quit via system tray, relaunch)
```

---

## macOS (Mac Mini) — Terminal (zsh/bash)

```bash
# 1. Resolve the bundled claude binary (latest installed version)
CLAUDE="$(ls -d "$HOME/Library/Application Support/Claude/claude-code/"*/ 2>/dev/null \
  | sort -V | tail -1)claude"
# Fallback if the line above finds nothing:
#   command -v claude            # (if Claude Code CLI is on your PATH, just use: claude)
#   find "$HOME/Library" -type f -name claude -path '*claude-code*' 2>/dev/null
echo "Using: $CLAUDE"

# 2a. FIRST-TIME INSTALL  (edit the path to your local clone)
"$CLAUDE" plugin marketplace add "$HOME/claude-code-sync"
"$CLAUDE" plugin install obsydia-skills@obsydia

# 2b. UPDATE after a `git pull` brought new/updated skills
"$CLAUDE" plugin marketplace update obsydia
"$CLAUDE" plugin update obsydia-skills@obsydia

# then fully restart the desktop app (Cmd+Q, relaunch)
```

---

## Verify (either OS)

```
<claude> plugin list
<claude> plugin details obsydia-skills@obsydia
```
`details` should show the version and the full skill inventory. After a full app
restart, the skills are invocable in the Code tab as `/obsydia-skills:<name>`
(e.g. `/obsydia-skills:caveman`).

## Adding a new skill (from any device where the plugin is installed)

Easiest — use the built-in command in a Code session:
```
/obsydia-skills:add-skill <skill-name-or-path>
```
It regenerates the mirror, bumps the version, commits, and pushes for you. Then
fully restart the app. On the OTHER devices: `git pull`, run the **2b UPDATE**
block above, and restart.

Manual equivalent (if you prefer): add the folder under `custom-skills/`, run
`bash sync-skills-to-plugin.sh`, bump `version` in
`obsydia-skills/.claude-plugin/plugin.json`, commit + push, then run **2b**.

> Note on paths: the Windows `claude.exe` location is verified. The macOS path
> above is the standard desktop-app location; if your Mac install differs, use
> the fallback finder in step 1 to locate the binary.
