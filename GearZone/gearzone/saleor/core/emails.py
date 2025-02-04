from django.contrib.sites.models import Site
from django.templatetags.static import static

from ..core.utils import build_absolute_uri


def get_email_context():
    site: Site = Site.objects.get_current()
    logo_url = build_absolute_uri(static("images/logo_light.svg"))
    send_email_kwargs = {"from_email": site.settings.default_from_email}
    email_template_context = {
        "domain": site.domain,
        "logo_url": logo_url,
        "site_name": site.name,
    }
    return send_email_kwargs, email_template_context
