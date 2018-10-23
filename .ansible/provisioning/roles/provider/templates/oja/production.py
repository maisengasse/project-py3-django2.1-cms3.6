from base import *

DEBUG = True
TEMPLATES[0]["OPTIONS"]["debug"] = DEBUG

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': '{{ db_name }}',
        'USER': '{{ db_user }}',
        'PASSWORD': '{{ db_password }}',
        'HOST': '127.0.0.1',
        'PORT': '',
        'OPTIONS': {
           "init_command": "SET default_storage_engine=INNODB,character_set_connection=utf8mb4,collation_connection=utf8mb4_unicode_ci",
        }
    },
}

MEDIA_ROOT = '/home/xadmin/django/{{ project_name }}/media'
MEDIA_URL = '/media/'
STATIC_ROOT = '/home/xadmin/django/{{ project_name }}/static'
STATIC_URL = '/static/'

# CACHES = {
#     'default': {
#         'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
#         'LOCATION': '127.0.0.1:11211',
#     }
# }


#PORTAL_URL = 'http://{{ project_domain }}'
PORTAL_URL = 'http://{{ project_name }}.kvm13963.profi-server.net'

STATICFILES_DIRS = (
    #os.path.join(BASE_DIR, 'static'),
)

#CSRF_COOKIE_DOMAIN = "mynet.at"
ALLOWED_HOSTS = '*'
