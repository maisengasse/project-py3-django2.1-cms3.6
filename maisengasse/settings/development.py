from .base import *

DEBUG = True
TEMPLATES[0]["OPTIONS"]["debug"] = DEBUG

MEDIA_ROOT = '/home/vagrant/media'
MEDIA_URL = '/media/'

STATIC_ROOT = '/home/vagrant/static/'
STATIC_URL = '/static/'

CMS_PAGE_CACHE = False
CMS_PLACEHOLDER_CACHE = False
CMS_PLUGIN_CACHE = False
CACHES = {
    "default": {
        "BACKEND": "django.core.cache.backends.dummy.DummyCache"
    }
}


PORTAL_URL = 'maisengasse.at'

STATICFILES_DIRS = (
    #os.path.join(BASE_DIR, 'static'),
)

LOCALE_PATHS = (
    "/home/vagrant/maisengasse/locale",
)

# NEWSLETTER_PORTAL_URL = PORTAL_URL
# NEWSLETTER_MEDIA_URL = STATIC_URL + 'maisengasse/newsletter/'
# NEWSLETTER_INCLUDE_UNSUBSCRIPTION = False
# NEWSLETTER_DEFAULT_HEADER_REPLY = "Newsletter <newsletter@maisengasse.at>"
# NEWSLETTER_DEFAULT_HEADER_SENDER = "Newsletter <newsletter@maisengasse.at>"
# NEWSLETTER_HTML_TEMPLATE = "mailings/newsletter_content.html"
# NEWSLETTER_TEXT_TEMPLATE = "mailings/newsletter_content_text.txt"

#CSRF_COOKIE_DOMAIN = "mynet.at"
ALLOWED_HOSTS = '*'
