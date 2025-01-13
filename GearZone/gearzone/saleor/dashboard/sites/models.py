# content/models.py
from django.db import models

class CustomKeyboardSlide(models.Model):
    title = models.CharField(max_length=255, blank=True, null=True)
    image = models.ImageField(upload_to="slides/")
    order = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ["order"]

    def __str__(self):
        return self.title or f"Slide {self.pk}"
