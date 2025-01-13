from rest_framework import generics
from .models import Product
from .serializers import ProductSerializer
from django.shortcuts import render

class ProductListView(generics.ListAPIView):
    serializer_class = ProductSerializer

    def get_queryset(self):
        category = self.request.query_params.get('category')
        if category:
            return Product.objects.filter(category=category)
        return Product.objects.all()

def customize_keyboard(request):
    return render(request, 'keyboard_builder/customize.html')
