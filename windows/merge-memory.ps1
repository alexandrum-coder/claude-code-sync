# ============================================================================
# merge-memory.ps1 - add the Mac project memory to the memory Windows really reads.
#
# Claude Code keys auto memory by the git repository, so every folder inside the
# repo D:\Claude Projects - Obsydia (Portal nou.rna.ro included) reads ONE memory:
#   %USERPROFILE%\.claude\projects\D--Claude-Projects---Obsydia\memory
# The Mac memory was unpacked next to it, in ...Portal-nou-rna-ro\memory, where
# nothing reads it. This script adds it to the repo memory, by addition only:
#   1. backs up the target memory folder (SHA-256 verified)
#   2. stops if ANY file name exists in both folders (except MEMORY.md)
#   3. copies the other files, never overwriting
#   4. appends the Mac index as a new section at the END of the target MEMORY.md
#      (the existing Windows index above it is not touched); runs once only
#
#   powershell -ExecutionPolicy Bypass -File .\windows\merge-memory.ps1 -DryRun
#   powershell -ExecutionPolicy Bypass -File .\windows\merge-memory.ps1
# ============================================================================
param(
  [string]$Source = (Join-Path $env:USERPROFILE '.claude\projects\D--Claude-Projects---Obsydia-Portal-nou-rna-ro\memory'),
  [string]$Target = (Join-Path $env:USERPROFILE '.claude\projects\D--Claude-Projects---Obsydia\memory'),
  [switch]$DryRun
)
$ErrorActionPreference = 'Stop'
$MARK = '## Memorii copiate de pe Mac (nou.rna.ro) - 26.09.2026'
$utf8 = New-Object System.Text.UTF8Encoding($false)
function Stop-Plan($s) { Write-Host ""; Write-Host "STOP: $s" -ForegroundColor Red; Write-Host "Send this output to the Mac."; exit 2 }

foreach ($d in @($Source, $Target)) { if (-not (Test-Path -LiteralPath $d)) { Stop-Plan "folder not found: $d" } }
$srcIndex = Join-Path $Source 'MEMORY.md'
$dstIndex = Join-Path $Target 'MEMORY.md'
if (-not (Test-Path -LiteralPath $srcIndex)) { Stop-Plan "no MEMORY.md in $Source" }
if (-not (Test-Path -LiteralPath $dstIndex)) { Stop-Plan "no MEMORY.md in $Target" }

$dstText = [IO.File]::ReadAllText($dstIndex, $utf8)
if ($dstText.Contains($MARK)) { Write-Host "Already merged: $dstIndex contains the Mac section. Nothing to do." -ForegroundColor Green; exit 0 }

$srcFiles = @(Get-ChildItem -LiteralPath $Source -File | Where-Object { $_.Name -ne 'MEMORY.md' })
$dstNames = @(Get-ChildItem -LiteralPath $Target -File | ForEach-Object Name)
$clash = @($srcFiles | Where-Object { $dstNames -contains $_.Name } | ForEach-Object Name)
if ($clash.Count -gt 0) { Stop-Plan ("same file name in both folders: " + ($clash -join ', ')) }

Write-Host "Source: $Source  ($($srcFiles.Count) files + MEMORY.md)"
Write-Host "Target: $Target  ($($dstNames.Count) files)"
Write-Host "Name clashes: none"

# Mac index without its title line; its sections become subsections of the new one.
$srcLines = [IO.File]::ReadAllText($srcIndex, $utf8) -split "`r?`n"
$body = ($srcLines | Select-Object -Skip 1 | ForEach-Object { $_ -replace '^## ', '### ' }) -join "`n"
$section = "`n`n$MARK`n$body`n"

if ($DryRun) {
  Write-Host "DRY: would back up $Target"
  Write-Host "DRY: would copy $($srcFiles.Count) files"
  Write-Host "DRY: would append $(($body -split "`n").Count) lines to $dstIndex under: $MARK"
  exit 0
}

# 1. backup
$bk = Join-Path $env:USERPROFILE ("claude-backup\memory-D--Claude-Projects---Obsydia-" + (Get-Date -Format 'yyyyMMdd-HHmmss'))
New-Item -ItemType Directory -Path $bk -Force | Out-Null
$ok = 0; $all = @(Get-ChildItem -LiteralPath $Target -File)
foreach ($f in $all) {
  $to = Join-Path $bk $f.Name
  Copy-Item -LiteralPath $f.FullName -Destination $to
  if ((Get-FileHash -LiteralPath $f.FullName).Hash -eq (Get-FileHash -LiteralPath $to).Hash) { $ok++ }
}
if ($ok -ne $all.Count) { Stop-Plan "backup verified only $ok/$($all.Count) in $bk" }
Write-Host "Backup verified: $ok/$($all.Count) OK  ->  $bk" -ForegroundColor Green

# 2. copy, never overwriting
$n = 0
foreach ($f in $srcFiles) {
  $to = Join-Path $Target $f.Name
  if (Test-Path -LiteralPath $to) { Stop-Plan "appeared during copy, not overwritten: $to" }
  Copy-Item -LiteralPath $f.FullName -Destination $to
  $n++
}
Write-Host "Copied: $n files" -ForegroundColor Green

# 3. append the Mac index
[IO.File]::AppendAllText($dstIndex, $section, $utf8)

# 4. verify
$after = @(Get-ChildItem -LiteralPath $Target -File).Count
$hasMark = [IO.File]::ReadAllText($dstIndex, $utf8).Contains($MARK)
$startsSame = [IO.File]::ReadAllText($dstIndex, $utf8).StartsWith($dstText)
Write-Host ""
Write-Host "Files in target: $after (expected $($dstNames.Count + $n))"
Write-Host "Mac section in MEMORY.md: $hasMark"
Write-Host "Windows index above it unchanged: $startsSame"
if ($after -eq ($dstNames.Count + $n) -and $hasMark -and $startsSame) {
  Write-Host "Merge verified." -ForegroundColor Green
} else { Stop-Plan "verification failed; the backup is in $bk" }
