from django.db import models

class Product(models.Model):
    CATEGORY_CHOICES = [
        ('keycap', 'Keycap'),
        ('switch', 'Switch'),
        ('kit', 'Kit'),
    ]

    name = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    image = models.ImageField(upload_to='products/')
    category = models.CharField(max_length=50, choices=CATEGORY_CHOICES)

    def __str__(self):
        return self.name
