param(
  [int]$Port = 8000
)

$rootPath = Resolve-Path .
$pythonCmd = Get-Command python -ErrorAction SilentlyContinue
if (-not $pythonCmd) {
  $pythonCmd = Get-Command py -ErrorAction SilentlyContinue
}

if ($pythonCmd) {
  Write-Host "Запуск локального сервера на http://localhost:$Port ..." -ForegroundColor Cyan
  & $pythonCmd.Path -m http.server $Port
} else {
  Write-Warning "Python не найден. Открываю index.html в браузере по умолчанию."
  Start-Process (Join-Path $rootPath "index.html")
}
