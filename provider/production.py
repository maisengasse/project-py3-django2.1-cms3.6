from .base import *

DEBUG = False
TEMPLATES[0]["OPTIONS"]["debug"] = DEBUG

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",
        "NAME": "maisengassedb1",
        "USER": "maisengasse",
        "PASSWORD": "",
        "HOST": "127.0.0.1",
        "PORT": "",
        "OPTIONS": {
            "init_command": "SET default_storage_engine=INNODB,character_set_connection=utf8mb4,collation_connection=utf8mb4_unicode_ci"
        },
    }
}

MEDIA_ROOT = BASE_DIR + "/../media"
MEDIA_URL = "/media/"
STATIC_ROOT = BASE_DIR + "/../static"
STATIC_URL = "/static/"

# COMPRESS_OFFLINE = True
# PORTAL_URL = 'https://www.maisengasse.at'
PORTAL_URL = "http://maisengasse.mgh2.mynet.at"

# CACHES = {
#     'default': {
#         'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
#         'LOCATION': '127.0.0.1:11211',
#         'KEY_PREFIX': 'maisengasse'
#     }
# }
# CMS_PAGE_CACHE = True
# CMS_PLACEHOLDER_CACHE = True
# CMS_PLUGIN_CACHE = True
# CMS_CACHE_DURATIONS = {
#    'content' : 300,
#    'permissions' : 3600,
#    'menus' : 3600,
# }

STATICFILES_DIRS = (
    # os.path.join(BASE_DIR, 'static'),
)

LOCALE_PATHS = (
    "/data/web/maisengasse/home/projects/maisengasse/maisengasse/locale",
)

# NEWSLETTER_PORTAL_URL = PORTAL_URL
# NEWSLETTER_MEDIA_URL = STATIC_URL + 'maisengasse/newsletter/'
# NEWSLETTER_INCLUDE_UNSUBSCRIPTION = False
# NEWSLETTER_DEFAULT_HEADER_REPLY = "maisengasse Newsletter <newsletter@maisengasse.at>"
# NEWSLETTER_DEFAULT_HEADER_SENDER = "maisengasse Newsletter <newsletter@maisengasse.at>"
# NEWSLETTER_HTML_TEMPLATE = "mailings/newsletter_content.html"
# NEWSLETTER_TEXT_TEMPLATE = "mailings/newsletter_content_text.txt"

# CSRF_COOKIE_DOMAIN = "mynet.at"
ALLOWED_HOSTS = "*"
