from django.http import JsonResponse
from .models import IceCream

def ice_cream_json_list(request):
    # Формируем массив данных через list comprehension[cite: 8]
    data = [
        {
            "id": ic.id,
            "name": ic.title,
            "price": float(ic.price)
        } 
        for ic in IceCream.objects.all()
    ]
    
    # Отправляем на фронтенд[cite: 8]
    return JsonResponse(data, safe=False)