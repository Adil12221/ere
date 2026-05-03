param(
  [string]$ProjectPath = ".",
  [switch]$Force
)

$projectPath = Resolve-Path -Path $ProjectPath
$cssDir = Join-Path $projectPath "css"
$jsDir = Join-Path $projectPath "js"

New-Item -ItemType Directory -Path $cssDir -Force | Out-Null
New-Item -ItemType Directory -Path $jsDir -Force | Out-Null

$files = @(
  @{ Path = Join-Path $projectPath "index.html"; Content = @"<!DOCTYPE html>
<html lang=\"ru\">
<head>
  <meta charset=\"UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <title>EcoTech — Landing Page</title>
  <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">
  <link rel=\"stylesheet\" href=\"css/style.css\">
</head>
<body>
  <nav class=\"navbar navbar-expand-lg navbar-dark bg-dark sticky-top\">
    <div class=\"container\">
      <a class=\"navbar-brand\" href=\"#home\">EcoTech</a>
      <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarNav\" aria-controls=\"navbarNav\" aria-expanded=\"false\" aria-label=\"Меню\">
        <span class=\"navbar-toggler-icon\"></span>
      </button>
      <div class=\"collapse navbar-collapse\" id=\"navbarNav\">
        <ul class=\"navbar-nav ms-auto\">
          <li class=\"nav-item\"><a class=\"nav-link active\" href=\"#home\">Home</a></li>
          <li class=\"nav-item\"><a class=\"nav-link\" href=\"#about\">About</a></li>
          <li class=\"nav-item\"><a class=\"nav-link\" href=\"#contacts\">Contacts</a></li>
        </ul>
      </div>
    </div>
  </nav>
  <main>
    <section id=\"home\" class=\"page-section active-section\">
      <div class=\"container py-5\">
        <div class=\"row align-items-center\">
          <div class=\"col-lg-6\">
            <h1>EcoTech — цифровые решения для вашего бизнеса</h1>
            <p class=\"lead\">Современные лендинги, сайты и маркетинговые кампании, которые помогают брендам расти.</p>
            <a class=\"btn btn-primary btn-lg me-2\" href=\"#contacts\">Связаться</a>
            <a class=\"btn btn-outline-light btn-lg text-dark\" href=\"#about\">Узнать больше</a>
          </div>
          <div class=\"col-lg-6 text-center mt-4 mt-lg-0\">
            <img src=\"https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=900&q=80\" alt=\"EcoTech\" class=\"img-fluid rounded shadow\">
          </div>
        </div>
      </div>
    </section>
    <section id=\"about\" class=\"page-section\">
      <div class=\"container py-5\">
        <h2 class=\"mb-4\">О компании</h2>
        <p>EcoTech помогает компаниям создавать впечатляющие сайты, автоматизировать процессы и запускать эффективную рекламу.</p>
        <div class=\"row mt-4\">
          <div class=\"col-md-4\"><div class=\"p-4 bg-light rounded shadow-sm\"><h5>Стратегия</h5><p>Анализ, позиционирование и план действий.</p></div></div>
          <div class=\"col-md-4\"><div class=\"p-4 bg-light rounded shadow-sm\"><h5>Дизайн</h5><p>Удобный интерфейс и современный визуал.</p></div></div>
          <div class=\"col-md-4\"><div class=\"p-4 bg-light rounded shadow-sm\"><h5>Реализация</h5><p>Готовый сайт, маркетинг и запуск.</p></div></div>
        </div>
      </div>
    </section>
    <section id=\"contacts\" class=\"page-section\">
      <div class=\"container py-5\">
        <h2 class=\"mb-4\">Контакты</h2>
        <p>Готовы обсудить проект? Напишите нам, мы ответим в течение рабочего дня.</p>
        <ul class=\"list-unstyled\">
          <li><strong>Телефон:</strong> +7 495 123-45-67</li>
          <li><strong>Email:</strong> hello@ecotech.ru</li>
          <li><strong>Адрес:</strong> Москва, ул. Тверская 12</li>
        </ul>
      </div>
    </section>
  </main>
  <footer class=\"bg-dark text-white py-3\"><div class=\"container text-center\">© 2026 EcoTech</div></footer>
  <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js\"></script>
  <script src=\"js/main.js\"></script>
</body>
</html>"@ }
  @{ Path = Join-Path $cssDir "style.css"; Content = "body { margin: 0; font-family: 'Inter', sans-serif; background: #f4f7fb; color: #111827; } .navbar { box-shadow: 0 2px 15px rgba(15, 23, 42, 0.12); } .page-section { display: none; } .page-section.active-section { display: block; } .page-section { padding: 4rem 0; } .lead { font-size: 1.1rem; color: #4b5563; } .btn-outline-light.text-dark { background: rgba(255,255,255,0.92); }" }
  @{ Path = Join-Path $jsDir "main.js"; Content = "document.addEventListener('DOMContentLoaded', () => { const sections = document.querySelectorAll('.page-section'); const navLinks = document.querySelectorAll('.nav-link'); const setActiveSection = (hash) => { const id = hash ? hash.slice(1) : 'home'; sections.forEach((section) => { section.classList.toggle('active-section', section.id === id); }); navLinks.forEach((link) => { link.classList.toggle('active', link.getAttribute('href') === `#${id}`); }); }; const updateRoute = () => { setActiveSection(window.location.hash || '#home'); }; window.addEventListener('hashchange', updateRoute); updateRoute(); });" }
)

foreach ($file in $files) {
  if ((Test-Path $file.Path) -and (-not $Force)) {
    Write-Host "Файл $($file.Path) уже существует. Используйте параметр -Force для перезаписи." -ForegroundColor Yellow
    continue
  }

  $file.Content | Set-Content -Path $file.Path -Encoding UTF8
  Write-Host "Создан файл: $($file.Path)"
}

Write-Host "Проект создан: $projectPath" -ForegroundColor Green
