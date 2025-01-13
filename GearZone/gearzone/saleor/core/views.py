import json

from django.contrib import messages
from django.template.response import TemplateResponse
from django.utils.translation import pgettext_lazy
from draftjs_sanitizer import SafeJSONEncoder
from impersonate.views import impersonate as orig_impersonate

from tests.conftest import category
from ..account.models import User
from ..dashboard.views import staff_member_required
from ..product.utils import products_for_homepage
from ..product.utils.availability import products_with_availability
from ..seo.schema.webpage import get_webpage_schema


# def home(request):
#     products = products_for_homepage(
#         request.user, request.site.settings.homepage_collection
#     )[:8]
#     products = list(
#         products_with_availability(
#             products,
#             discounts=request.discounts,
#             country=request.country,
#             local_currency=request.currency,
#             extensions=request.extensions,
#         )
#     )
#     webpage_schema = get_webpage_schema(request)
#     return TemplateResponse(
#         request,
#         "home.html",
#         {
#             "parent": None,
#             "products": products,
#             "webpage_schema": json.dumps(webpage_schema, cls=SafeJSONEncoder),
#         },
#     )

from .models import BuildKeyboardSlide

def home(request):
    show_slides = False  # Biến để kiểm soát hiển thị slide
    slides = None

    if request.method == "POST":
        experience = request.POST.get("experience")
        if experience == "newbie":
            show_slides = True
            slides = BuildKeyboardSlide.objects.all()
            messages.success(
                request,
                pgettext_lazy(
                    "Survey response",
                    "Thank you for sharing! Check out these tips for building your first custom keyboard.",
                ),
            )
        elif experience == "experienced":
            messages.success(
                request,
                pgettext_lazy(
                    "Survey response",
                    "Awesome! Glad to see seasoned keyboard builders here!",
                ),
            )
        return TemplateResponse(
            request,
            "home.html",
            {
                "show_slides": show_slides,
                "slides": slides,
            },
        )

    products = products_for_homepage(
        request.user, request.site.settings.homepage_collection
    )[:8]
    products = list(
        products_with_availability(
            products,
            discounts=request.discounts,
            country=request.country,
            local_currency=request.currency,
            extensions=request.extensions,
        )
    )
    webpage_schema = get_webpage_schema(request)

    return TemplateResponse(
        request,
        "home.html",
        {
            "parent": None,
            "products": products,
            "webpage_schema": json.dumps(webpage_schema, cls=SafeJSONEncoder),
            "show_slides": show_slides,
            "slides": slides,
        },
    )


@staff_member_required
def styleguide(request):
    return TemplateResponse(request, "styleguide.html")


def impersonate(request, uid):
    response = orig_impersonate(request, uid)
    if request.session.modified:
        msg = pgettext_lazy(
            "Impersonation message",
            "You are now logged as {}".format(User.objects.get(pk=uid)),
        )
        messages.success(request, msg)
    return response


def handle_404(request, exception=None):
    return TemplateResponse(request, "404.html", status=404)


def manifest(request):
    return TemplateResponse(request, "manifest.json", content_type="application/json")
