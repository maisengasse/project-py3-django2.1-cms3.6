# -*- coding: utf-8 -*-
"""
Django settings for {{ project_name }} project.

For more information on this file, see
https://docs.djangoproject.com/en/1.9/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.9/ref/settings/
"""

import os

VERSION = "0.0.1"
SITE_ID = 1

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.9/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = "asdf66l^nzuu3mt0d6%oaz69fog0%1op7!8=d*3437hux#wxq%_+x)"

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []

SERVER_EMAIL = "django@{{ project_domain }}"
ADMINS = [("Maisengasse Errors", "cinquecento@maisengasse.at")]

SSL_URLS = []
# Application definition

INSTALLED_APPS = [
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.staticfiles",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.sitemaps",
    "djangocms_page_sitemap",
    "django.contrib.sites",
    "maisen.cmstools.adminstyle",
    "djangocms_admin_style",  # for the admin skin. You **must** add 'djangocms_admin_style' in the list **before** 'django.contrib.admin'.
    "modeltranslation",
    "django.contrib.admin",
    "compressor",
    # 'debug_toolbar',
    "maisen.cmstools.stencils",
    # Django CMS
    "cms",  # django CMS itself
    "treebeard",  # utilities for implementing a tree
    "menus",  # helper for model independent hierarchical website navigation
    "sekizai",  # for javascript and css management
    "reversion",
    # 'haystack',
    "filer",
    "easy_thumbnails",
    "ckeditor",
    "codemirror2",
    "bootstrap4",
    "maisen.cmstools",
    "maisen.cmstools.filerpool",
    "maisen.cmstools.editables",
    "maisen.cmstools.addresses",
    # plugins
    "maisen.cmstools.workflows",
    # 'maisen.cmstools.flex',
    "rosetta",
    "phonenumber_field",
    # Uncomment the next line to enable admin documentation:
    # 'django.contrib.admindocs',
    # newsletter
    # 'emencia.django.newsletter',
    # 'project.mailings',
    # project
    "{{ project_name }}",
    # translation extensensions
    "maisen.cmstools.stencils.translated",
    # 'maisen.cmstools.flex.translated',
    "maisen.cmstools.editables.translated",
]

MIDDLEWARE = [
    "cms.middleware.utils.ApphookReloadMiddleware",
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.locale.LocaleMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
    "maisen.cmstools.middleware.FixLinkTargetsMiddleware",
    "maisen.cmstools.middleware.ResolveInternalLinksMiddleware",
    "maisen.cmstools.middleware.RedirectToFirstSubpageMiddleware",
    "cms.middleware.user.CurrentUserMiddleware",
    "cms.middleware.page.CurrentPageMiddleware",
    "cms.middleware.toolbar.ToolbarMiddleware",
    "cms.middleware.language.LanguageCookieMiddleware",
]

ROOT_URLCONF = "{{ project_name }}.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": ["%s/templates" % BASE_DIR],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
                "sekizai.context_processors.sekizai",
                "cms.context_processors.cms_settings",
                "{{ project_name }}.context_processors.globals",
            ]
        },
    }
]

# WSGI_APPLICATION = 'wsgi.application'

# Database
# https://docs.djangoproject.com/en/1.9/ref/settings/#databases

DATABASES = {
    "default": {
        "ENGINE": "maisen.cmstools.db.backends.mysql",
        # 'ENGINE': 'django.db.backends.mysql',
        "NAME": "{{ project_name }}",
        "USER": "{{ project_name }}",
        "PASSWORD": "",
        "HOST": "127.0.0.1",
        "PORT": "",
        "OPTIONS": {
            "init_command": "SET default_storage_engine=INNODB,character_set_connection=utf8mb4,collation_connection=utf8mb4_unicode_ci"
        },
    }
}


# Password validation
# https://docs.djangoproject.com/en/1.9/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator"
    },
    {"NAME": "django.contrib.auth.password_validation.MinimumLengthValidator"},
    {"NAME": "django.contrib.auth.password_validation.CommonPasswordValidator"},
    {"NAME": "django.contrib.auth.password_validation.NumericPasswordValidator"},
]

LOGIN_URL = "/login/"

# Internationalization
# https://docs.djangoproject.com/en/1.9/topics/i18n/


def gettext(s):
    return s


LANGUAGES = (
    ("de", gettext(u"Deutsch")),
    # ('en', gettext(u'Englisch')),
    # ('nl', gettext(u'Niederländisch')),
)
LANGUAGE_CODE = "de"

TIME_ZONE = "Europe/Vienna"
USE_I18N = True
USE_L10N = True
USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.9/howto/static-files/
STATIC_URL = "/static/"
STATIC_ROOT = os.path.join(BASE_DIR, "static")

# Additional locations of static files
STATICFILES_DIRS = [
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
]

# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = [
    "django.contrib.staticfiles.finders.FileSystemFinder",
    "django.contrib.staticfiles.finders.AppDirectoriesFinder",
    # 'django.contrib.staticfiles.finders.DefaultStorageFinder',
    "compressor.finders.CompressorFinder",
]


# User-uploaded files
# https://docs.djangoproject.com/en/1.9/topics/files/

MEDIA_URL = "/media/"
MEDIA_ROOT = os.path.join(BASE_DIR, "media")
FILE_UPLOAD_PERMISSIONS = 0o644

EMAIL_SUBJECT_PREFIX = "[{{ project_domain }}] "

# INTERNAL_IPS = ['127.0.0.1', '10.0.2.2']


# django-compressor settings
COMPRESS_ENABLED = True
COMPRESS_PRECOMPILERS = [
    ("text/less", "lessc {infile} {outfile}"),
    ("text/x-scss", "{{ project_name }}.compressor_filters.PatchedSCSSCompiler"),
]


CMS_TEMPLATES = (
    ("default.html", gettext("Standard")),
    ("small-header.html", gettext("Schmaler Header")),
    # ('home.html', gettext('Startseite')),
)

CMS_PLACEHOLDER_CONF = {
    "content": {
        "name": "Inhalt",
        "plugins": [],
        "plugin_modules": {},
    }
}

CMS_PLACEHOLDER_CONF["header"] = CMS_PLACEHOLDER_CONF["content"].copy()
CMS_PLACEHOLDER_CONF["header"]["name"] = gettext("Kopfbereich")

STENCILS_ENABLED = [
    "Slider",
    "Grouper",
    "FullText",
    "FullImage",
    "FullImageWithText",
    "ImageWithText",
    "HighlightGroup",
    "TeaserGroup",
    "ImageWithColumnText",
    "Highlight",
]

for stencil in STENCILS_ENABLED:
    for ph in ("content", "header"):
        CMS_PLACEHOLDER_CONF[ph]["plugins"].append(stencil)
        CMS_PLACEHOLDER_CONF[ph]["plugin_modules"][stencil] = "Stencils"


STENCILS_CONTAINER_CHOICES = [
    # ('container-fluid', gettext(u'Normale Breite')),
    ("container", gettext(u"Normale Breite")),
    ("", gettext(u"Volle Breite")),
]

STENCILS_IMAGE_RATIOS = [(16, 9), (4, 3), (1, 1), (3, 4)]


CMS_SHOW_START_DATE = True
CMS_SHOW_END_DATE = CMS_SHOW_START_DATE
CMS_REDIRECTS = True

CKEDITOR_UPLOAD_PATH = "ckeditor/users/"
CKEDITOR_RESTRICT_BY_USER = True
CKEDITOR_IMAGE_BACKEND = "pillow"
CKEDITOR_CONFIGS = {
    "default": {
        "contentsCss": "%s{{ project_name }}/css/rte.css?v=%s" % (STATIC_URL, VERSION),
        "customConfig": "%s{{ project_name }}/js/rte.js?v=%s" % (STATIC_URL, VERSION),
        "removePlugins": "stylesheetparser,link",
        "extraPlugins": "adv_link",
        "width": "800px",
        "stylesSet": "default",
        "startupOutlineBlocks" : True,
        "toolbar": [
            ["Styles"],
            ["Bold", "Italic", "Underline"],
            ["BulletedList", "NumberedList"],
            ["Link", "Unlink", "Anchor"],
            ["SpecialChar", "Paste", "PasteText", "PasteFromWord"],
            ["Table"],
            ["Undo", "Redo"],
            ["RemoveFormat", "ShowBlocks", "Source"],
        ],
    }
}

THUMBNAIL_ALIASES = {
    "": {
        "photopool": {"size": (120, 80), "crop": False},
        "ogimage": {"size": (1200, 630), "crop": True},
        "fancybox": {"size": (2400, 0), "crop": False},
        "fullwidth": {"size": (1200, 0), "crop": False},
        "halfwidth": {"size": (600, 0), "crop": False},
        "quarterwidth": {"size": (300, 0), "crop": False},
        "smallsquare": {"size": (300, 300), "crop": True},
        "fullhd": {"size": (1920, 1080), "crop": True},
    }
}

PLACEHOLDER_IMAGE_ID = 1
DEFAULT_SEO_IMAGE = 2

THUMBNAIL_PROCESSORS = (
    "easy_thumbnails.processors.colorspace",
    "easy_thumbnails.processors.autocrop",
    "filer.thumbnail_processors.scale_and_crop_with_subject_location",
    "easy_thumbnails.processors.filters",
    # '{{ project_name }}.processors.gauss',
)

CMSTOOLS_INTERNALLINKS_HANDLERS = [
    "maisen.cmstools.internallinks.InternalPageLinks",
    "maisen.cmstools.filerpool.models.InternalDownloadLinks",
    "{{ project_name }}.views.InternalActionsLinks",
]

FLEX_PLACEHOLDER_IMAGE_ID = 1
FLEX_SECTION_DISPLAY_CONFIG = {
    # 'greybox' : {
    #     "name" : 'Grauer Hintergrund',
    #     "css" : {
    #         "wrapper" : "bg-full",
    #         "inner" : "container",
    #     }
    # }
}
FLEX_SECTION_DIVISION_CONFIG = {
    # 'variable-right' : {
    #     "name" : "Variabel Rechts (4 Spalten)",
    #     "widths" : [3,3,4,2]
    # },
    # 'variable-left' : {
    #     "name" : "Variabel Links (4 Spalten)",
    #     "widths" : [2,4,3,3]
    # }
}
FLEX_TEXT_COLUMNS = [1, 2, 3, 4]

# def FLEX_SECTION_CHILD_CONFIG(default):
#     default.update({
#         "ProjektTeaserPlugin" : {
#             'order' : 5,
#             'label' : 'Projekt-Teaser',
#             'initial' : {
#                 'title' : u'Teaser',
#             }
#         },
#     })
#     return default


FILERPOOL_ITEM_OPTIONS = (
    # label    title    type
    ("Bildunterschrift", "caption", "input"),
    # ('Titel EN', 'title_en', 'textarea'),
)

# EMAIL_HOST = "mail.maisengasse.at"
# EMAIL_HOST_USER = "postfuchs@maisengasse.at"
# EMAIL_HOST_PASSWORD = "forexternalmails"
# EMAIL_USE_TLS = True

MAIL_SUBJECT_PREFIX = ""
INQUIRY_RECIPIENT = "armin@maisengasse.at"

# CACHES = {
#     'default': {
#         'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
#         'LOCATION': '127.0.0.1:11211',
#     }
# }


# A sample logging configuration. The only tangible logging
# performed by this configuration is to send an email to
# the site admins on every HTTP 500 error when DEBUG=False.
# See http://docs.djangoproject.com/en/dev/topics/logging for
# more details on how to customize your logging configuration.
LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "filters": {"require_debug_false": {"()": "django.utils.log.RequireDebugFalse"}},
    "handlers": {
        "mail_admins": {
            "level": "ERROR",
            "filters": ["require_debug_false"],
            "class": "django.utils.log.AdminEmailHandler",
        }
    },
    "loggers": {
        "django.request": {
            "handlers": ["mail_admins"],
            "level": "ERROR",
            "propagate": True,
        }
    },
}
