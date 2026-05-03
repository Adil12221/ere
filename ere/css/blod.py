from django.urls import path
from . import views

app_name = 'blog'  # Псевдоним приложения

urlpatterns = [
    path('posts/', views.post_list, name='list'),  # Маршрут для списка постов
]