from django.urls import path
from . import views

app_name = 'main'  # Псевдоним приложения

urlpatterns = [
    path('', views.index, name='home'),  # Маршрут для главной страницы
]