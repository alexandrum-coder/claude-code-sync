# ============================================================================
# setup-windows.ps1 - make the Windows Claude setup match the Mac baseline.
#
# Run from the root of your claude-code-sync clone, ONE mode at a time:
#   powershell -ExecutionPolicy Bypass -File .\windows\setup-windows.ps1 -Backup
#   powershell -ExecutionPolicy Bypass -File .\windows\setup-windows.ps1 -Pilot
#   powershell -ExecutionPolicy Bypass -File .\windows\setup-windows.ps1 -All
#   powershell -ExecutionPolicy Bypass -File .\windows\setup-windows.ps1 -Update
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
  [switch]$Backup, [switch]$Pilot, [switch]$All, [switch]$Update,
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

$modes = @($Backup, $Pilot, $All, $Update) | Where-Object { $_ }
if ($modes.Count -ne 1) { Write-Host "Choose exactly one mode: -Backup, -Pilot, -All or -Update"; exit 1 }

# ---------------------------------------------------------------- claude.exe
function Find-Claude {
  $root = Join-Path $env:APPDATA 'Claude\claude-code'
  if (Test-Path $root) {
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
$last = Get-ChildItem $BROOT -Directory -ErrorAction SilentlyContinue | Sort-Object Name -Descending | Select-Object -First 1
if (-not $last -or -not (Test-Path (Join-Path $last.FullName 'SHA256SUMS.txt'))) { Stop-Plan "no verified backup found in $BROOT. Run -Backup first." }
Write-Host "Using backup: $($last.FullName)"

$script:CLAUDE = Find-Claude
if (-not $script:CLAUDE) { Stop-Plan "claude.exe not found (looked in %APPDATA%\Claude\claude-code and PATH)" }
Write-Host "Using claude: $script:CLAUDE  ($(& $script:CLAUDE --version))"

$base = Load (Join-Path $PSScriptRoot 'mac-baseline.json')
if (-not $base) { Stop-Plan "windows\mac-baseline.json missing or unreadable" }

# ---------------------------------------------------------------- marketplaces / plugins
function Known-Marketplaces { $k = Load (Join-Path $CL 'plugins\known_marketplaces.json'); if ($k) { return $k } return (New-Object PSObject) }
function Installed-Plugins  { $i = Load (Join-Path $CL 'plugins\installed_plugins.json'); if ($i -and $i.plugins) { return @(Names $i.plugins) } return @(Names $i) }

function Norm($s) { return ([string]$s).Trim().TrimEnd('/').ToLower() -replace '\.git$', '' -replace '\\', '/' }

function Ensure-Marketplace([string]$name, [string]$source) {
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

function Ensure-Plugin([string]$id) {
  if ((Installed-Plugins) -contains $id) { Skip "plugin $id (already installed)"; return }
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

# ---------------------------------------------------------------- modes
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
}

Write-Host ""
if ($notes.Count -gt 0) { Write-Host "Notes:" -ForegroundColor Yellow; $notes | ForEach-Object { Write-Host "  - $_" } }
Write-Host "Done. Quit the Claude app from the system tray and relaunch it." -ForegroundColor Green
