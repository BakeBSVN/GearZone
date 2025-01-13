# import i18naddress
# from django import template
# from django.utils.translation import pgettext
#
# register = template.Library()
#
#
# @register.inclusion_tag("formatted_address.html")
# def format_address(address, include_phone=True, inline=False, latin=False):
#     address_data = address.as_data()
#     address_data["name"] = (
#         pgettext("Address data", "%(first_name)s %(last_name)s") % address_data
#     )
#     address_data["country_code"] = address_data["country"]
#     address_data["street_address"] = pgettext(
#         "Address data", "%(street_address_1)s\n" "%(street_address_2)s" % address_data
#     )
#     address_lines = i18naddress.format_address(address_data, latin).split("\n")
#     if include_phone and address.phone:
#         address_lines.append(address.phone)
#     return {"address_lines": address_lines, "inline": inline}
import i18naddress
from django import template
from django.utils.translation import pgettext

register = template.Library()


@register.inclusion_tag("formatted_address.html")
def format_address(address, include_phone=True, inline=False, latin=False):
    # Kiểm tra nếu address không rỗng
    if not address:
        return {"address_lines": [], "inline": inline}

    # Lấy dữ liệu từ address
    address_data = address.as_data()

    # Định nghĩa "name" từ first_name và last_name (dùng .get() để an toàn)
    address_data["name"] = pgettext(
        "Address data", "%(first_name)s %(last_name)s"
    ) % {
                               "first_name": address_data.get("first_name", ""),
                               "last_name": address_data.get("last_name", ""),
                           }

    # Định nghĩa mã quốc gia
    address_data["country_code"] = address_data.get("country", "")

    # Định dạng địa chỉ đường phố
    address_data["street_address"] = pgettext(
        "Address data", "%(street_address_1)s\n%(street_address_2)s"
    ) % {
                                         "street_address_1": address_data.get(
                                             "street_address_1", ""),
                                         "street_address_2": address_data.get(
                                             "street_address_2", ""),
                                     }

    # Định dạng địa chỉ sử dụng i18naddress
    address_lines = i18naddress.format_address(address_data, latin).split("\n")

    # Thêm số điện thoại nếu có
    if include_phone and getattr(address, "phone", None):
        address_lines.append(address.phone)

    return {"address_lines": address_lines, "inline": inline}
