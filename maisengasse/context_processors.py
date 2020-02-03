from django.conf import settings


def globals(request):
    return {"PORTAL_URL": settings.PORTAL_URL}
