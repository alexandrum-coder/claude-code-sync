# ============================================================================
# setup-windows.ps1 - make the Windows Claude setup match the Mac baseline.
#
# Run from the root of your claude-code-sync clone, ONE mode at a time:
#   powershell -ExecutionPolicy Bypass -File .\windows\setup-windows.ps1 -Backup
#   powershell -ExecutionPolicy Bypass -File .\windows\setup-windows.ps1 -Pilot
#   powershell -ExecutionPolicy Bypass -File .\windows\setup-windows.ps1 -All
#   powershell -ExecutionPolicy Bypass -File .\windows\setup-windows.ps1 -Update
#   powershell -ExecutionPolicy Bypass -File .\windows\setup-windows.ps1 -FixPermissions
#   powershell -ExecutionPolicy Bypass -File .\windows\setup-windows.ps1 -Check
# Add -DryRun to any mode to print what would run, without running it.
#
#   -Backup  copies the Claude settings files to %USERPROFILE%\claude-backup\<time>\
#            with SHA256SUMS.txt, and verifies every copy. Changes nothing else.
#   -Pilot   one marketplace + one plugin (caveman), to prove the method works.
#   -All     every marketplace and plugin from windows\mac-baseline.json, the
#            obsydia marketplace from this clone, the global CLAUDE.md, and the
#            MCP servers task-master-ai, composio, notebooklm.
#   -Update  later, after changes on the Mac: git pull, refresh marketplaces and
#            plugins, refresh CLAUDE.md.
#   -Check   read-only: did an ACCOUNT copy of obsydia-skills override the local
#            one at the last app start? (obsydia-skills is delivered locally only,
#            from this repo; an account copy with the same name always wins.)
#   -FixPermissions  removes the permissions.ask list from the user settings.json
#            (ask rules prompt even in Bypass mode; the Mac has none). Everything
#            else in the file is kept. The old file is in the backup.
#
# Safety:
#   * -Pilot / -All / -Update refuse to run without a verified backup.
#   * Nothing is ever deleted. Existing marketplaces/plugins/MCP servers are skipped.
#   * STOPS (exit 2) if a marketplace exists under the same name with another
#     source, if claude.exe is missing, or if a command fails.
#   * An existing CLAUDE.md that differs from the repo copy is NOT overwritten
#     unless you add -ReplaceClaudeMd (the old one is in the backup).
#   * API keys are typed by you at a hidden prompt; they are never written to
#     this script, the repo, or any log.
# After -Pilot, -All or -Update: quit the Claude app from the system tray and relaunch.
# ============================================================================
param(
  [switch]$Backup, [switch]$Pilot, [switch]$All, [switch]$Update, [switch]$FixPermissions, [switch]$Check,
  [switch]$DryRun, [switch]$ReplaceClaudeMd
)
$ErrorActionPreference = 'Stop'
$U     = $env:USERPROFILE
$CL    = Join-Path $U '.claude'
$REPO  = Split-Path -Parent $PSScriptRoot
$BROOT = Join-Path $U 'claude-backup'
$notes = New-Object System.Collections.Generic.List[string]

function Ok($s)   { Write-Host "  OK   $s" -ForegroundColor Green }
function Skip($s) { Write-Host "  SKIP $s" -ForegroundColor DarkGray }
function Warn($s) { Write-Host "  WARN $s" -ForegroundColor Yellow; $notes.Add($s) }
function Stop-Plan($s) { Write-Host ""; Write-Host "STOP: $s" -ForegroundColor Red; Write-Host "Nothing further was changed. Send this output to the Mac."; exit 2 }
function Load($p) { if (Test-Path -LiteralPath $p) { return (Get-Content -LiteralPath $p -Raw -Encoding UTF8 | ConvertFrom-Json) } return $null }
function Names($o) { if ($null -eq $o) { return @() } return @($o.PSObject.Properties.Name) }

$modes = @(@($Backup, $Pilot, $All, $Update, $FixPermissions, $Check) | Where-Object { $_ })
if ($modes.Count -ne 1) { Write-Host "Choose exactly one mode: -Backup, -Pilot, -All, -Update, -FixPermissions or -Check"; exit 1 }

# ---------------------------------------------------------------- account-copy check
function Check-Override {
  # The log location differs per install type and app version (classic, Microsoft
  # Store, older leftovers), so search every Claude folder and read the newest main*.log.
  $roots = @()
  $roots += @(Get-ChildItem $env:APPDATA -Directory -Filter 'Claude*' -ErrorAction SilentlyContinue)
  $roots += @(Get-ChildItem $env:LOCALAPPDATA -Directory -Filter 'Claude*' -ErrorAction SilentlyContinue)
  $roots += @(Get-ChildItem (Join-Path $env:LOCALAPPDATA 'Packages') -Directory -Filter 'Claude_*' -ErrorAction SilentlyContinue)
  $cands = @($roots | ForEach-Object { Get-ChildItem $_.FullName -Recurse -File -Filter 'main*.log' -ErrorAction SilentlyContinue } |
    Sort-Object LastWriteTime -Descending)
  Write-Host "  newest app logs found:"
  $cands | Select-Object -First 3 | ForEach-Object { Write-Host ("    " + $_.LastWriteTime + "  " + $_.FullName) }
  $log = if ($cands.Count -gt 0) { $cands[0].FullName } else { $null }
  if (-not $log) { Write-Host "  (app log not found; cannot check)"; return $true }
  if ($cands[0].LastWriteTime -lt (Get-Date).AddHours(-12)) {
    Write-Host "  CANNOT CHECK: the newest app log is older than 12 hours, so it does not describe the current app." -ForegroundColor Yellow
    Write-Host "  Send this output to the Mac (the list above shows where the logs are)." -ForegroundColor Yellow
    return $true
  }
  Write-Host ("  log: " + $log + "  (last written " + (Get-Item -LiteralPath $log).LastWriteTime + ")")
  $lines = @(Get-Content -LiteralPath $log -Encoding UTF8)
  $last = -1
  for ($i = $lines.Count - 1; $i -ge 0; $i--) { if ($lines[$i] -like '*plugin(s) to SDK*') { $last = $i; break } }
  if ($last -lt 0) { Write-Host "  (no session start in the app log yet)"; return $true }
  $from = [Math]::Max(0, $last - 80)
  $hit = $lines[$from..$last] | Where-Object { $_ -like '*"obsydia-skills@obsydia" exists in both remote and local*' }
  $when = $lines[$last].Substring(0, [Math]::Min(19, $lines[$last].Length))
  if ($hit) {
    Write-Host "  WARN at the last app start ($when) an ACCOUNT copy of obsydia-skills overrode the local one." -ForegroundColor Yellow
    Write-Host "       Remove every obsydia-skills entry in Customize -> Plugins, quit the app fully, reopen, run -Check again." -ForegroundColor Yellow
    return $false
  }
  Write-Host "  OK   at the last app start ($when) no account copy overrode the local obsydia-skills" -ForegroundColor Green
  return $true
}
if ($Check) { Write-Host "CHECK"; if (Check-Override) { exit 0 } else { exit 3 } }

# ---------------------------------------------------------------- claude.exe
function Find-Claude {
  # Bundled copy: classic install, then Microsoft Store (MSIX) install, then PATH.
  $roots = @((Join-Path $env:APPDATA 'Claude\claude-code'))
  $roots += @(Get-ChildItem (Join-Path $env:LOCALAPPDATA 'Packages') -Directory -Filter 'Claude_*' -ErrorAction SilentlyContinue |
    ForEach-Object { Join-Path $_.FullName 'LocalCache\Roaming\Claude\claude-code' })
  foreach ($root in $roots) {
    if (-not (Test-Path $root)) { continue }
    $dir = Get-ChildItem $root -Directory | Where-Object { Test-Path (Join-Path $_.FullName 'claude.exe') } |
      Sort-Object { try { [version]$_.Name } catch { [version]'0.0' } } -Descending | Select-Object -First 1
    if ($dir) { return (Join-Path $dir.FullName 'claude.exe') }
  }
  $c = Get-Command claude -ErrorAction SilentlyContinue
  if ($c) { return $c.Source }
  return $null
}

function Run-Claude([string[]]$argv, [string]$what) {
  if ($DryRun) { Write-Host "  DRY  claude $($argv -join ' ')"; return }
  & $script:CLAUDE @argv
  if ($LASTEXITCODE -ne 0) { Stop-Plan "command failed ($what): claude $($argv -join ' ')" }
}

# ---------------------------------------------------------------- backup
$files = @(
  (Join-Path $CL 'settings.json'), (Join-Path $CL 'settings.local.json'),
  (Join-Path $CL 'plugins\installed_plugins.json'), (Join-Path $CL 'plugins\known_marketplaces.json'),
  (Join-Path $CL 'CLAUDE.md'), (Join-Path $U '.claude.json')
)

if ($Backup) {
  $dest = Join-Path $BROOT (Get-Date -Format 'yyyyMMdd-HHmmss')
  Write-Host "Backup to $dest"
  if ($DryRun) { $files | ForEach-Object { Write-Host "  DRY  copy $_" }; exit 0 }
  New-Item -ItemType Directory -Path $dest -Force | Out-Null
  $sums = New-Object System.Collections.Generic.List[string]
  $n = 0; $good = 0
  foreach ($f in $files) {
    if (-not (Test-Path -LiteralPath $f)) { Skip "not present: $f"; continue }
    $n++
    $rel = $f.Substring($U.Length).TrimStart('\') -replace '\\', '__'
    $to = Join-Path $dest $rel
    Copy-Item -LiteralPath $f -Destination $to
    $h1 = (Get-FileHash -LiteralPath $f -Algorithm SHA256).Hash
    $h2 = (Get-FileHash -LiteralPath $to -Algorithm SHA256).Hash
    $sums.Add("$h2  $rel  <-  $f")
    if ($h1 -eq $h2) { $good++; Ok $rel } else { Warn "hash mismatch: $rel" }
  }
  $sums | Set-Content -LiteralPath (Join-Path $dest 'SHA256SUMS.txt') -Encoding UTF8
  Write-Host ""
  if ($good -eq $n) { Write-Host "Backup verified: $good/$n OK" -ForegroundColor Green; exit 0 }
  Stop-Plan "backup verified only $good/$n"
}

# ---------------------------------------------------------------- preconditions
# Only settings backups made by -Backup (named yyyyMMdd-HHmmss, with SHA256SUMS.txt);
# other folders here, e.g. memory-* from merge-memory.ps1, are not settings backups.
$last = Get-ChildItem $BROOT -Directory -ErrorAction SilentlyContinue |
  Where-Object { $_.Name -match '^\d{8}-\d{6}$' -and (Test-Path (Join-Path $_.FullName 'SHA256SUMS.txt')) } |
  Sort-Object Name -Descending | Select-Object -First 1
if (-not $last) { Stop-Plan "no verified backup found in $BROOT. Run -Backup first." }
Write-Host "Using backup: $($last.FullName)"

$script:CLAUDE = Find-Claude
if (-not $script:CLAUDE) { Stop-Plan "claude.exe not found (looked in %APPDATA%\Claude\claude-code and PATH)" }
Write-Host "Using claude: $script:CLAUDE  ($(& $script:CLAUDE --version))"

$base = Load (Join-Path $PSScriptRoot 'mac-baseline.json')
if (-not $base) { Stop-Plan "windows\mac-baseline.json missing or unreadable" }

# ---------------------------------------------------------------- marketplaces / plugins
function Known-Marketplaces { $k = Load (Join-Path $CL 'plugins\known_marketplaces.json'); if ($k) { return $k } return (New-Object PSObject) }
# Only user-scope installs count: on the Mac every plugin is user scope, while a
# project-scope install (seen on Windows) exists only inside one folder.
function Installed-Plugins {
  $i = Load (Join-Path $CL 'plugins\installed_plugins.json')
  $pl = if ($i -and $i.plugins) { $i.plugins } else { $i }
  $ids = @()
  foreach ($x in @($pl.PSObject.Properties)) {
    if (@($x.Value) | Where-Object { $_.scope -eq 'user' }) { $ids += $x.Name }
  }
  return $ids
}

# 'owner/repo', 'https://github.com/owner/repo.git' and 'git@github.com:owner/repo.git'
# all name the same repository.
function Norm($s) {
  $n = ([string]$s).Trim().TrimEnd('/').ToLower() -replace '\\', '/'
  $n = $n -replace '^https://github\.com/', '' -replace '^git@github\.com:', ''
  return ($n -replace '\.git$', '')
}
# This machine has no SSH key for GitHub; clones go over HTTPS (Git Credential Manager).
function To-Https($s) { return ([string]$s -replace '^git@github\.com:', 'https://github.com/') }

function Ensure-Marketplace([string]$name, [string]$source) {
  $source = To-Https $source
  $km = Known-Marketplaces
  if ((Names $km) -contains $name) {
    $s = $km.$name.source
    $have = if ($s.repo) { $s.repo } elseif ($s.url) { $s.url } else { $s.path }
    if ((Norm $have) -eq (Norm $source)) { Skip "marketplace $name (already added)"; return }
    Stop-Plan "marketplace '$name' already exists with another source: '$have' (expected '$source')"
  }
  Write-Host "  ADD  marketplace $name <- $source"
  Run-Claude @('plugin', 'marketplace', 'add', $source) "marketplace $name"
  if (-not $DryRun -and -not ((Names (Known-Marketplaces)) -contains $name)) {
    Stop-Plan "marketplace from '$source' was added under a different name than '$name'"
  }
  if (-not $DryRun) { Ok "marketplace $name" }
}

function Is-Enabled([string]$id) {
  $st = Load (Join-Path $CL 'settings.json')
  if ($st -and $st.enabledPlugins -and ((Names $st.enabledPlugins) -contains $id)) { return [bool]$st.enabledPlugins.$id }
  return $false
}

function Ensure-Plugin([string]$id) {
  if ((Installed-Plugins) -contains $id) {
    if (Is-Enabled $id) { Skip "plugin $id (already installed and enabled)"; return }
    Write-Host "  ON   plugin $id (installed, not enabled)"
    Run-Claude @('plugin', 'enable', $id) "enable $id"
    if (-not $DryRun) { Ok "plugin $id enabled" }
    return
  }
  Write-Host "  ADD  plugin $id"
  Run-Claude @('plugin', 'install', $id) "plugin $id"
  if (-not $DryRun) { Ok "plugin $id" }
}

function Source-Of([string]$name) {
  $m = $base.marketplaces | Where-Object { $_.name -eq $name } | Select-Object -First 1
  if (-not $m) { Stop-Plan "marketplace '$name' not in mac-baseline.json" }
  return $m.add
}

# ---------------------------------------------------------------- CLAUDE.md
function Sync-ClaudeMd([string]$previousRepoHash) {
  $src = Join-Path $REPO 'CLAUDE.md'
  $dst = Join-Path $CL 'CLAUDE.md'
  $hs = (Get-FileHash -LiteralPath $src -Algorithm SHA256).Hash
  if (Test-Path -LiteralPath $dst) {
    $hd = (Get-FileHash -LiteralPath $dst -Algorithm SHA256).Hash
    if ($hd -eq $hs) { Skip "CLAUDE.md (already identical)"; return }
    $isOurOldCopy = $previousRepoHash -and ($hd -eq $previousRepoHash)
    if (-not $isOurOldCopy -and -not $ReplaceClaudeMd) {
      Warn "CLAUDE.md exists with different content and was NOT replaced. Compare it with the repo copy; rerun with -ReplaceClaudeMd to replace it (the old one is in the backup)."
      return
    }
  }
  if ($DryRun) { Write-Host "  DRY  copy $src -> $dst"; return }
  Copy-Item -LiteralPath $src -Destination $dst -Force
  Ok "CLAUDE.md copied from the repo"
}

# ---------------------------------------------------------------- MCP servers
function Mcp-Names { $cj = Load (Join-Path $U '.claude.json'); if ($cj) { return @(Names $cj.mcpServers) } return @() }

function Read-Secret([string]$label) {
  $sec = Read-Host "  Paste $label (Enter to skip; input is hidden)" -AsSecureString
  $b = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($sec)
  try { return [Runtime.InteropServices.Marshal]::PtrToStringAuto($b) } finally { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($b) }
}

function Ensure-Mcp {
  $have = Mcp-Names
  if ($have -contains 'task-master-ai') { Skip "MCP task-master-ai" } else {
    $key = if ($DryRun) { '' } else { Read-Secret 'the ANTHROPIC_API_KEY for task-master-ai' }
    if ([string]::IsNullOrEmpty($key)) { Warn "MCP task-master-ai skipped (no key given)" }
    else {
      Run-Claude @('mcp', 'add', '--scope', 'user', '-e', "ANTHROPIC_API_KEY=$key", 'task-master-ai', '--', 'cmd', '/c', 'npx', '-y', '--package=task-master-ai', 'task-master-ai') 'MCP task-master-ai'
      Ok "MCP task-master-ai"
    }
    $key = $null
  }
  if ($have -contains 'composio') { Skip "MCP composio" } else {
    Run-Claude @('mcp', 'add', '--scope', 'user', '--transport', 'http', 'composio', 'https://connect.composio.dev/mcp') 'MCP composio'
    Warn "MCP composio added: sign in once from a terminal: claude, then /mcp, then composio"
  }
  if ($have -contains 'notebooklm') { Skip "MCP notebooklm" } else {
    $uv = Get-Command uv -ErrorAction SilentlyContinue
    if (-not $uv) { Warn "MCP notebooklm skipped: 'uv' is not installed (https://docs.astral.sh/uv/)"; return }
    $exe = Join-Path $U '.local\bin\notebooklm-mcp.exe'
    if (-not (Test-Path $exe)) {
      Write-Host "  ADD  uv tool notebooklm-py"
      if ($DryRun) { Write-Host "  DRY  uv tool install notebooklm-py[mcp,browser,cookies] from git" }
      else {
        & uv tool install 'notebooklm-py[mcp,browser,cookies] @ git+https://github.com/teng-lin/notebooklm-py'
        if ($LASTEXITCODE -ne 0) { Stop-Plan "uv tool install notebooklm-py failed" }
      }
    }
    Run-Claude @('mcp', 'add', '--scope', 'user', 'notebooklm', '--', $exe) 'MCP notebooklm'
    Warn "MCP notebooklm added: sign in once with: notebooklm login"
  }
}

# ---------------------------------------------------------------- permissions
function Fix-Permissions {
  $p = Join-Path $CL 'settings.json'
  $d = Load $p
  if (-not $d) { Stop-Plan "settings.json missing or unreadable: $p" }
  if (-not $d.permissions -or -not ((Names $d.permissions) -contains 'ask')) { Skip "no permissions.ask in settings.json"; return }
  $rules = @($d.permissions.ask)
  Write-Host "  Removing $($rules.Count) ask rule(s):"
  $rules | ForEach-Object { Write-Host "    - $_" }
  $keysBefore = @(Names $d) -join ','
  if ($DryRun) { Write-Host "  DRY  write $p without permissions.ask"; return }
  $d.permissions.PSObject.Properties.Remove('ask')
  $json = $d | ConvertTo-Json -Depth 50
  # UTF-8 without BOM: a BOM breaks JSON parsing in Claude Code.
  [System.IO.File]::WriteAllText($p, $json, (New-Object System.Text.UTF8Encoding($false)))
  $v = Load $p
  if (-not $v) { Stop-Plan "settings.json unreadable after write. Restore it from the backup: $($last.FullName)" }
  if ($v.permissions -and ((Names $v.permissions) -contains 'ask')) { Stop-Plan "permissions.ask still present after write" }
  if ((@(Names $v) -join ',') -ne $keysBefore) { Stop-Plan "top-level keys changed after write. Restore it from the backup: $($last.FullName)" }
  Ok "permissions.ask removed; other settings unchanged (keys: $keysBefore)"
}

# ---------------------------------------------------------------- modes
if ($FixPermissions) {
  Write-Host "`nPERMISSIONS"
  Fix-Permissions
}

if ($Pilot) {
  Write-Host "`nPILOT: caveman"
  Ensure-Marketplace 'caveman' (Source-Of 'caveman')
  Ensure-Plugin 'caveman@caveman'
}

if ($All) {
  Write-Host "`nMARKETPLACES"
  foreach ($m in $base.marketplaces) { Ensure-Marketplace $m.name $m.add }
  Ensure-Marketplace 'obsydia' $REPO
  Write-Host "`nPLUGINS"
  foreach ($p in $base.plugins) { Ensure-Plugin $p }
  Write-Host "`nCLAUDE.md"
  Sync-ClaudeMd $null
  # The account copy of obsydia-skills (which wins in the desktop app) carries no
  # agents/, so agents are placed as loose files, the same way they sit on the Mac.
  Write-Host "`nAGENTS"
  $ad = Join-Path $CL 'agents'
  foreach ($a in (Get-ChildItem (Join-Path $REPO 'obsydia-skills\agents') -Filter *.md -ErrorAction SilentlyContinue)) {
    $to = Join-Path $ad $a.Name
    if (Test-Path -LiteralPath $to) { Skip "agent $($a.Name) (already present)"; continue }
    if ($DryRun) { Write-Host "  DRY  copy $($a.FullName) -> $to"; continue }
    New-Item -ItemType Directory -Path $ad -Force | Out-Null
    Copy-Item -LiteralPath $a.FullName -Destination $to
    Ok "agent $($a.Name)"
  }
  Write-Host "`nMCP"
  Ensure-Mcp
}

if ($Update) {
  $dst = Join-Path $CL 'CLAUDE.md'
  $prev = (Get-FileHash -LiteralPath (Join-Path $REPO 'CLAUDE.md') -Algorithm SHA256).Hash
  Write-Host "`nGIT PULL"
  if ($DryRun) { Write-Host "  DRY  git -C $REPO pull --ff-only" }
  else { & git -C $REPO pull --ff-only; if ($LASTEXITCODE -ne 0) { Stop-Plan "git pull failed" } }
  $base = Load (Join-Path $PSScriptRoot 'mac-baseline.json')
  Write-Host "`nMARKETPLACES"
  foreach ($m in $base.marketplaces) { Ensure-Marketplace $m.name $m.add }
  Ensure-Marketplace 'obsydia' $REPO
  foreach ($n in (Names (Known-Marketplaces))) { Run-Claude @('plugin', 'marketplace', 'update', $n) "marketplace update $n" }
  Write-Host "`nPLUGINS"
  foreach ($p in $base.plugins) { Ensure-Plugin $p; Run-Claude @('plugin', 'update', $p) "plugin update $p" }
  Write-Host "`nCLAUDE.md"
  Sync-ClaudeMd $prev
  Write-Host "`nACCOUNT COPY CHECK (last app start, before this update)"
  if (-not (Check-Override)) { $notes.Add("an account copy of obsydia-skills overrode the local one at the last app start") }
}

Write-Host ""
if ($notes.Count -gt 0) { Write-Host "Notes:" -ForegroundColor Yellow; $notes | ForEach-Object { Write-Host "  - $_" } }
Write-Host "Done. Quit the Claude app from the system tray and relaunch it." -ForegroundColor Green
if ($All) { Write-Host "Next: run -Update once, so plugins that were already installed (e.g. obsydia-skills 1.1.2) move to the current version." }
Write-Host "After the relaunch, confirm with: -Check"
