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

MEDIA_ROOT = BASE_DIR + '/../media'
MEDIA_URL = '/media/'
STATIC_ROOT = BASE_DIR + '/../static'
STATIC_URL = '/static/'

PORTAL_URL = '{{ project_domain }}'
PORTAL_URL = '{{ project_name }}.mgh1.mynet.at'

STATICFILES_DIRS = (
    #os.path.join(BASE_DIR, 'static'),
)

#CSRF_COOKIE_DOMAIN = "mynet.at"
ALLOWED_HOSTS = '*'
