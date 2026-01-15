Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$srcBin = Join-Path $repoRoot "dist\ciro.exe"
$targetDir = Join-Path $HOME "bin"
$targetBin = Join-Path $targetDir "ciro.exe"

if (-not (Test-Path $srcBin)) {
  Write-Host "No se encontro el binario en $srcBin"
  Write-Host "Primero generarlo con PyInstaller y renombrarlo a dist\\ciro.exe"
  exit 1
}

New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
Copy-Item -Force $srcBin $targetBin

Write-Host "Instalado: $targetBin"
Write-Host "Si $targetDir no esta en tu PATH, agrega:"
Write-Host "  `$env:Path += `";$targetDir`""
