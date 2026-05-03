from django.db import models
 

 # models.py

class Kiosk(models.Model):
    name = models.CharField(max_length=255)
    location = models.CharField(max_length=255)

    def __str__(self):
        return self.name


class IceCream(models.Model):
    name = models.CharField(max_length=255)
    flavor = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=6, decimal_places=2)

    # связь many-to-one (много мороженого → один киоск)
    kiosk = models.ForeignKey(
        Kiosk,
        on_delete=models.CASCADE,
        related_name="ice_creams"
    )
#
    def __str__(self):
        return self.name
    
    class Parent(models.Model):
    full_name = models.CharField(max_length=255)

    def __str__(self):
        return self.full_name

# связь one-to-many (один родитель → много детей) реализуется через ForeignKey в модели Child
class Child(models.Model):
    full_name = models.CharField(max_length=255)
    age = models.PositiveIntegerField()

    # many-to-one: много детей → один родитель
    parent = models.ForeignKey(
        Parent,
        on_delete=models.CASCADE,
        related_name="children"
    )

    def __str__(self):
        return self.full_name