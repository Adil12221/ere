# views.py
from django.http import JsonResponse
from .models import Task

def get_filtered_tasks(request):
    try:
        # 1. Выбираем только часть колонок (например, заголовок и статус)
        partial_data = list(Task.objects.values('title', 'is_completed'))
        
        # 2. Исключаем определенные значения (например, исключаем задачи с низким приоритетом)
        filtered_data = list(Task.objects.exclude(priority='low').values('title', 'priority'))
        
        return JsonResponse({
            'partial': partial_data,
            'filtered': filtered_data
        })
    
    except Exception as e:
        return JsonResponse(
            {"error": "Failed to fetch filtered tasks"},
            status=500
        )