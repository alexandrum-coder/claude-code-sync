# ============================================================================
# diagnose-windows.ps1 - READ-ONLY inventory of the Claude setup on Windows.
#
# Run from the root of your claude-code-sync clone:
#   powershell -ExecutionPolicy Bypass -File .\windows\diagnose-windows.ps1
#
# Changes nothing. Writes one text report to your Desktop:
#   claude-diagnose-<date-time>.txt
# Same sections as mac/inventory-mac.sh, plus Windows-only checks.
# Secrets are never printed: MCP servers show name/type/command only, env and
# header values are left out, and long token-like strings are replaced with
# [SECRET_REDACTED].
# ============================================================================
$ErrorActionPreference = 'Continue'
$U   = $env:USERPROFILE
$CL  = Join-Path $U '.claude'
$out = New-Object System.Collections.Generic.List[string]

function W($s)   { $out.Add([string]$s) }
function Sec($t) { W ''; W "== $t" }
function Red($s) { return ([regex]::Replace([string]$s, '[A-Za-z0-9_\-]{24,}', '[SECRET_REDACTED]')) }
function Load($p) {
  if (-not (Test-Path -LiteralPath $p)) { return $null }
  try { return (Get-Content -LiteralPath $p -Raw -Encoding UTF8 | ConvertFrom-Json) }
  catch { W "UNREADABLE JSON: $p"; return $null }
}
function Props($o) { if ($null -eq $o) { return @() } return $o.PSObject.Properties }

W '# Claude inventory - Windows'
W ("date: " + (Get-Date -Format 'yyyy-MM-dd HH:mm'))
W ("user profile: $U")

Sec 'VERSION'
$ccRoot = Join-Path $env:APPDATA 'Claude\claude-code'
if (Test-Path $ccRoot) {
  Get-ChildItem $ccRoot -Directory | ForEach-Object {
    $exe = Join-Path $_.FullName 'claude.exe'
    if (Test-Path $exe) { W ("bundled: " + $_.Name + " | " + (& $exe --version 2>&1)) }
  }
} else { W "bundled: MISSING ($ccRoot)" }
$onPath = Get-Command claude -ErrorAction SilentlyContinue
if ($onPath) { W ("claude on PATH: " + $onPath.Source + " | " + (& claude --version 2>&1)) } else { W 'claude on PATH: MISSING' }

foreach ($name in @('settings.json', 'settings.local.json')) {
  Sec "SETTINGS $name"
  $d = Load (Join-Path $CL $name)
  if ($null -eq $d) { W 'MISSING'; continue }
  W ("keys: " + ((Props $d | ForEach-Object Name | Sort-Object) -join ', '))
  $p = $d.permissions
  foreach ($k in @('defaultMode', 'disableBypassPermissionsMode', 'blockReadsOutsideWorkingDirectories')) {
    $v = if ($p -and ($p.PSObject.Properties.Name -contains $k)) { $p.$k } else { '-' }
    W "${k}: $v"
  }
  foreach ($k in @('ask', 'deny', 'allow')) { if ($p -and $p.$k) { foreach ($r in $p.$k) { W ("${k}: " + (Red $r)) } } }
  W ("env names: " + ((Props $d.env | ForEach-Object Name) -join ', '))
  W ("hooks events: " + ((Props $d.hooks | ForEach-Object Name) -join ', '))
}

Sec 'MANAGED_SETTINGS'
foreach ($m in @('C:\Program Files\ClaudeCode\managed-settings.json', 'C:\ProgramData\ClaudeCode\managed-settings.json')) {
  if (Test-Path $m) {
    W "PRESENT: $m"
    $md = Load $m
    if ($md -and $md.permissions) { W ("  permissions keys: " + ((Props $md.permissions | ForEach-Object Name) -join ', ')); W ("  disableBypassPermissionsMode: " + $md.permissions.disableBypassPermissionsMode) }
  } else { W "absent: $m" }
}
foreach ($rk in @('HKLM:\SOFTWARE\Policies\ClaudeCode', 'HKCU:\SOFTWARE\Policies\ClaudeCode')) {
  if (Test-Path $rk) { W "PRESENT registry policy: $rk" } else { W "absent registry policy: $rk" }
}

Sec 'MARKETPLACES'
$km = Load (Join-Path $CL 'plugins\known_marketplaces.json')
foreach ($m in (Props $km)) {
  $s = $m.Value.source
  $where = if ($s.repo) { $s.repo } elseif ($s.url) { $s.url } else { $s.path }
  W ("{0} | {1} | {2}" -f $m.Name, $s.source, $where)
}

Sec 'PLUGINS'
$ip = Load (Join-Path $CL 'plugins\installed_plugins.json')
$pl = if ($ip -and $ip.plugins) { $ip.plugins } else { $ip }
foreach ($x in (Props $pl)) {
  $v = @($x.Value)[0]
  W ("{0} | {1}" -f $x.Name, $v.version)
}

Sec 'ENABLED'
$st = Load (Join-Path $CL 'settings.json')
if ($st) { foreach ($x in (Props $st.enabledPlugins)) { W ("{0} | {1}" -f $x.Name, $x.Value) } }

Sec 'MCP'
$cj = Load (Join-Path $U '.claude.json')
if ($cj) {
  foreach ($x in (Props $cj.mcpServers)) {
    $v = $x.Value
    $t = if ($v.type) { $v.type } else { 'stdio' }
    $c = if ($v.command) { $v.command } else { $v.url }
    W ("{0} | {1} | {2} | env names: {3}" -f $x.Name, $t, (Red $c), ((Props $v.env | ForEach-Object Name) -join ', '))
  }
}

Sec 'PROJECT_SETTINGS'
if ($cj -and $cj.projects) {
  foreach ($pr in (Props $cj.projects)) {
    $dir = $pr.Name
    foreach ($f in @('settings.json', 'settings.local.json')) {
      $pf = Join-Path $dir ".claude\$f"
      if (Test-Path -LiteralPath $pf) {
        $pd = Load $pf
        $pp = if ($pd) { $pd.permissions } else { $null }
        W ("{0} | {1}" -f $dir, $f)
        if ($pp) {
          if ($pp.defaultMode) { W ("  defaultMode: " + $pp.defaultMode) }
          foreach ($k in @('ask', 'deny', 'allow')) { if ($pp.$k) { foreach ($r in $pp.$k) { W ("  ${k}: " + (Red $r)) } } }
        }
      }
    }
  }
}

Sec 'CLAUDE_MD'
$cm = Join-Path $CL 'CLAUDE.md'
if (Test-Path $cm) {
  $it = Get-Item $cm
  W ("file, bytes: " + $it.Length + " | link type: " + $it.LinkType)
  W ("contains the 'sunt' rule: " + [bool](Select-String -LiteralPath $cm -Pattern 'Romanian spelling' -Quiet))
} else { W 'MISSING' }

Sec 'MEMORY'
Get-ChildItem (Join-Path $CL 'projects') -Directory -ErrorAction SilentlyContinue | ForEach-Object {
  $m = Join-Path $_.FullName 'memory'
  $n = if (Test-Path $m) { (Get-ChildItem $m -File).Count } else { 0 }
  W ("{0} | {1} files" -f $_.Name, $n)
}

Sec 'LOOSE_SKILLS'
Get-ChildItem (Join-Path $CL 'skills') -Directory -ErrorAction SilentlyContinue | Where-Object { Test-Path (Join-Path $_.FullName 'SKILL.md') } | ForEach-Object { W $_.Name }

Sec 'LOOSE_AGENTS'
Get-ChildItem (Join-Path $CL 'agents') -Filter *.md -ErrorAction SilentlyContinue | ForEach-Object { W $_.Name }

# Desktop app data folder: classic install or Microsoft Store (MSIX) install.
$appDirs = @((Join-Path $env:APPDATA 'Claude'))
$appDirs += @(Get-ChildItem (Join-Path $env:LOCALAPPDATA 'Packages') -Directory -Filter 'Claude_*' -ErrorAction SilentlyContinue | ForEach-Object { Join-Path $_.FullName 'LocalCache\Roaming\Claude' })

Sec 'ACCOUNT_PLUGINS'
$seen = @{}
foreach ($a in $appDirs) {
  $lams = Join-Path $a 'local-agent-mode-sessions'
  if (-not (Test-Path $lams)) { continue }
  Get-ChildItem $lams -Recurse -Filter plugin.json -ErrorAction SilentlyContinue |
    Where-Object { $_.FullName -match '\\rpm\\[^\\]+\\\.claude-plugin\\plugin\.json$' } |
    ForEach-Object { $d = Load $_.FullName; if ($d) { $seen["$($d.name) | $($d.version)"] = 1 } }
}
$seen.Keys | Sort-Object | ForEach-Object { W $_ }

Sec 'DESKTOP_PERMISSION_PREFS'
foreach ($a in $appDirs) {
  $dc = Load (Join-Path $a 'claude_desktop_config.json')
  if ($null -eq $dc) { continue }
  W "config: $a"
  $pr = $dc.preferences
  foreach ($k in @('bypassPermissionsOptInByAccount', 'bypassPermissionsGateByAccount')) {
    foreach ($x in (Props $pr.$k)) { W ("{0} | {1} | {2}" -f $k, $x.Name, $x.Value) }
  }
  foreach ($x in (Props $pr.epitaxyPrefs)) {
    if ($x.Name -like 'epitaxy-folder-permission-mode.*') {
      $acct = $x.Name.Substring('epitaxy-folder-permission-mode.'.Length)
      foreach ($f in (Props $x.Value)) { W ("folder-mode | {0} | {1} | {2}" -f $acct, $f.Name, $f.Value) }
    }
  }
  $cfg = Load (Join-Path $a 'config.json')
  if ($cfg -and $cfg.lastKnownAccountUuid) { W ("lastKnownAccountUuid: " + $cfg.lastKnownAccountUuid) }
}

Sec 'DESKTOP_LOG_REMOTE_OVERRIDES'
foreach ($a in $appDirs) {
  $log = Join-Path $a 'logs\main.log'
  if (Test-Path $log) { Select-String -LiteralPath $log -Pattern 'exists in both remote and local' | Select-Object -Last 20 | ForEach-Object { W $_.Line } }
}

Sec 'TOOLS'
foreach ($t in @('git', 'node', 'npx', 'uv', 'python', 'ssh')) {
  $c = Get-Command $t -ErrorAction SilentlyContinue
  W ("{0}: {1}" -f $t, $(if ($c) { $c.Source } else { 'MISSING' }))
}
W ("Git Bash: " + (Test-Path 'C:\Program Files\Git\bin\bash.exe'))
W ("CLAUDE_CODE_* env names: " + ((Get-ChildItem env: | Where-Object Name -like 'CLAUDE_CODE_*' | ForEach-Object Name) -join ', '))

Sec 'GITHUB_SSH'
$ssh = Get-Command ssh -ErrorAction SilentlyContinue
if ($ssh) {
  $r = (& ssh -o BatchMode=yes -o ConnectTimeout=10 -o StrictHostKeyChecking=accept-new -T git@github.com 2>&1) -join ' '
  W (Red $r)
} else { W 'ssh MISSING' }

Sec 'REPO_CLONE'
$repo = Split-Path -Parent $PSScriptRoot
W "clone path: $repo"
if (Get-Command git -ErrorAction SilentlyContinue) {
  W ("branch/commit: " + (& git -C $repo log --oneline -1 2>&1))
  W ("status: " + ((& git -C $repo status --short 2>&1) -join '; '))
}

$file = Join-Path ([Environment]::GetFolderPath('Desktop')) ("claude-diagnose-" + (Get-Date -Format 'yyyyMMdd-HHmm') + ".txt")
$out | Set-Content -LiteralPath $file -Encoding UTF8
Write-Host ""
Write-Host "Report written: $file" -ForegroundColor Green
Write-Host "Send this file to the Mac (RustDesk file transfer). Nothing was changed."
