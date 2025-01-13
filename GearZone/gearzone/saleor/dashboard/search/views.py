from django.conf import settings
from django.http import Http404
from django.shortcuts import render
from django.http import JsonResponse

from ..views import staff_member_required
from .forms import DashboardSearchForm


def limit_results(*results):
    """Pass-through only first few best items for each result query."""
    limit = settings.DASHBOARD_SEARCH_LIMIT
    return (qs[:limit] for qs in results)


def get_results(request, form):
    user = request.user
    results = form.search()
    products = results["products"]
    orders = results["orders"]
    users = results["users"]
    if not user.has_perm("order.manage_orders"):
        orders = orders.none()
    if not user.has_perm("account.manage_users"):
        users = users.none()
    return limit_results(products, orders, users)

@staff_member_required
def search(request):
    if not settings.ENABLE_SEARCH:
        raise Http404("No such page!")
    form = DashboardSearchForm(data=request.GET or None)
    query = ""
    users = []
    products = []
    orders = []
    if form.is_valid():
        products, orders, users = get_results(request, form)
        query = form.cleaned_data["q"]
    ctx = {
        "form": form,
        "query": query,
        "products": products,
        "orders": orders,
        "users": users,
        "query_string": "?q=%s" % query,
    }
    return render(request, "dashboard/search/results.html", ctx)

@staff_member_required
@staff_member_required
def search_suggestions(request):
    if not settings.ENABLE_SEARCH:
        return JsonResponse({"suggestions": []})
    query = request.GET.get("q", "")
    form = DashboardSearchForm(data={"q": query})
    if form.is_valid():
        results = form.search()
        suggestions = {
            "products": [{"name": product.name, "image_url": product.image_url} for product in results["products"] if product.name.startswith(query)],
            "orders": [{"id": order.id, "name": f"Order #{order.id}"} for order in results["orders"] if str(order.id).startswith(query)],
            "users": [{"username": user.username, "full_name": user.get_full_name()} for user in results["users"] if user.get_full_name().startswith(query)],
        }
    else:
        suggestions = {"products": [], "orders": [], "users": []}
    return JsonResponse(suggestions)


