from django import forms
from django.contrib.sites.models import Site
from django.utils.translation import pgettext_lazy
from .models import CustomKeyboardSlide
from ...site.models import AuthorizationKey, SiteSettings

class SiteForm(forms.ModelForm):
    class Meta:
        model = Site
        exclude = []
        labels = {
            "domain": pgettext_lazy("Domain name (FQDN)", "Domain name"),
            "name": pgettext_lazy("Display name", "Display name"),
        }
# content/forms.py



class CustomKeyboardSlideForm(forms.ModelForm):
    class Meta:
        model = CustomKeyboardSlide
        fields = ["title", "image", "order"]


class SiteSettingsForm(forms.ModelForm):
    class Meta:
        model = SiteSettings
        fields = [
            "header_text",
            "description",
            "track_inventory_by_default",
            "default_weight_unit",
            "default_mail_sender_name",
            "default_mail_sender_address",
        ]
        labels = {
            "header_text": pgettext_lazy("Header text", "Header text"),
            "description": pgettext_lazy("Description", "Description"),
            "track_inventory_by_default": pgettext_lazy(
                "Inventory tracking by default settings toggle label",
                "Enable inventory tracking for newly created products",
            ),
            "default_weight_unit": pgettext_lazy(
                "Default weight unit", "Default weight unit"
            ),
            "default_mail_sender_name": pgettext_lazy(
                "Site settings's default email sender info", "Full Name"
            ),
            "default_mail_sender_address": pgettext_lazy(
                "Site settings's default email sender info", "Email Address"
            ),
        }
        help_texts = {
            "track_inventory_by_default": pgettext_lazy(
                "handle stock by default settings field help text",
                "This will set the default value of stock handling "
                "on product and variant creation",
            )
        }


class AuthorizationKeyForm(forms.ModelForm):
    class Meta:
        model = AuthorizationKey
        exclude = []
        labels = {
            "key": pgettext_lazy("Key for chosen authorization method", "Key"),
            "password": pgettext_lazy("Password", "Password"),
            "name": pgettext_lazy("Item name", "Name"),
        }
        widgets = {
            "password": forms.PasswordInput(render_value=True),
            "key": forms.TextInput(),
            "site_settings": forms.widgets.HiddenInput(),
        }
