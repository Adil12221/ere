param(
  [string]$VenvPath = ".\venv"
)

$pythonPath = Join-Path $VenvPath "Scripts\python.exe"
if (-not (Test-Path $pythonPath)) {
  Write-Error "Не найден интерпретатор Python в виртуальном окружении. Убедитесь, что оно создано в $VenvPath."
  exit 1
}

Write-Host "Замораживаю зависимости в requirements.txt..." -ForegroundColor Cyan
& $pythonPath -m pip freeze | Set-Content -Path "requirements.txt" -Encoding UTF8
Write-Host "requirements.txt создан." -ForegroundColor Green
