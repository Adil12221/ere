param(
  [string]$VenvPath = ".\venv",
  [switch]$Force
)

$pythonCmd = Get-Command python -ErrorAction SilentlyContinue
if (-not $pythonCmd) {
  $pythonCmd = Get-Command py -ErrorAction SilentlyContinue
}

if (-not $pythonCmd) {
  Write-Error "Python не найден. Установите Python и повторите попытку."
  exit 1
}

if ((Test-Path $VenvPath) -and (-not $Force)) {
  Write-Error "Виртуальное окружение уже существует. Используйте -Force для пересоздания."
  exit 1
}

if (Test-Path $VenvPath) {
  Remove-Item -Recurse -Force $VenvPath
}

Write-Host "Создаю виртуальное окружение в $VenvPath..." -ForegroundColor Cyan
& $pythonCmd.Path -m venv $VenvPath
Write-Host "Виртуальное окружение создано." -ForegroundColor Green
