# Instala os mods deste repositório no Claude Code (Windows):
# baixa o Claude-Fables do autor e aponta o settings.json para as pastas dos mods.
# Correr de novo atualiza o Claude-Fables para a versão mais recente do autor.
param(
    [string]$SettingsPath = (Join-Path $HOME '.claude\settings.json')
)

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot

git -C $root submodule update --init --remote Claude-Fables
if ($LASTEXITCODE -ne 0) { throw 'Não consegui baixar o Claude-Fables.' }

$mods = @('Claude-Fables', 'limite-diario') | ForEach-Object { (Join-Path $root $_) -replace '\\', '/' }

if (Test-Path $SettingsPath) {
    Copy-Item $SettingsPath "$SettingsPath.bak" -Force
    $settings = Get-Content $SettingsPath -Raw -Encoding UTF8 | ConvertFrom-Json
} else {
    New-Item -ItemType Directory -Force (Split-Path $SettingsPath) | Out-Null
    $settings = New-Object PSObject
}

if (-not $settings.PSObject.Properties['env']) {
    $settings | Add-Member -NotePropertyName env -NotePropertyValue (New-Object PSObject)
}

$dirs = @()
if ($settings.env.PSObject.Properties['CLAUDE_CODE_PLUGIN_DIRS']) {
    $dirs = @($settings.env.CLAUDE_CODE_PLUGIN_DIRS -split ';' | Where-Object { $_ })
}
foreach ($mod in $mods) {
    # Uma pasta com o mesmo nome já na lista é o mesmo mod instalado noutro sítio: não o carregar duas vezes.
    $name = Split-Path $mod -Leaf
    if (-not ($dirs | Where-Object { (Split-Path $_ -Leaf) -eq $name })) { $dirs += $mod }
}
$settings.env | Add-Member -NotePropertyName CLAUDE_CODE_PLUGIN_DIRS -NotePropertyValue ($dirs -join ';') -Force

$json = $settings | ConvertTo-Json -Depth 100
[IO.File]::WriteAllText($SettingsPath, $json, (New-Object Text.UTF8Encoding($false)))

Write-Host 'Mods instalados:'
$dirs | ForEach-Object { Write-Host "  $_" }
Write-Host 'Reinicie a app do Claude para carregar.'
