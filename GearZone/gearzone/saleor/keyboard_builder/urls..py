from django.urls import path
from .views import ProductListView, customize_keyboard
app_name = "keyboard_builder"
urlpatterns = [
    path('products/', ProductListView.as_view(), name='product-list'),
    path('customize/', customize_keyboard, name='customize-keyboard'),
]
