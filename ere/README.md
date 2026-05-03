# Скрипты автоматизации

В этой папке находятся PowerShell-скрипты для управления проектом.

## Как использовать

1. Откройте PowerShell в корне проекта.
2. Выполните нужный скрипт.

### Создание проекта с нуля

```powershell
.\scripts\create_project.ps1
```

Если нужно перезаписать файлы, добавьте флаг `-Force`:

```powershell
.\scripts\create_project.ps1 -Force
```

### Запуск проекта

```powershell
.\scripts\run_project.ps1
```

Если Python установлен, скрипт запустит локальный сервер на порту `8000`.
Если Python отсутствует, откроет `index.html` в браузере.

### Создание виртуального окружения

```powershell
.\scripts\create_venv.ps1
```

По умолчанию создаётся `venv`.

### Заморозка зависимостей

```powershell
.\scripts\freeze_requirements.ps1
```

Сгенерирует `requirements.txt` на основе пакетов из виртуального окружения.

## Заливка на GitHub

Если у вас ещё нет репозитория, выполните:

```powershell
git init
git add .
git commit -m "Add automation scripts"
git remote add origin <URL>
git branch -M main
git push -u origin main
```

> В этом окружении `git` недоступен, поэтому выполнить пуш здесь нельзя. Используйте локальный терминал с установленным Git.
# 203344444444443
