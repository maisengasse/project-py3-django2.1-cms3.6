"""{{ project_name }} URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""

from django.conf import settings
from django.conf.urls import url, include
from django.conf.urls.static import static
from django.conf.urls.i18n import i18n_patterns
from django.contrib import admin
from cms.sitemaps import CMSSitemap

from django.contrib.sitemaps import views as sitemap_views
from cms import urls as cms_urls
# from ckeditor import urls as ckeditor_urls
from maisen.cmstools.filerpool import urls as filerpool_urls
from maisen.cmstools import views as cmstools_views

from {{ project_name }} import views as {{ project_name }}_views


admin.autodiscover()

urlpatterns = [
    # url(r'^translate/', include('rosetta.urls')),
    url(r'^admin/linktree/?$', cmstools_views.linktree),
    url(r'^filerpool/', include(filerpool_urls)),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^sitemap\.xml$', sitemap_views.sitemap,
                           {'sitemaps': {'cmspages': CMSSitemap }}),
    url(r'^', include(cms_urls)),
]

# urlpatterns += i18n_patterns(
# )

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

    # from debug_toolbar import urls as debug_toolbar_urls
    # urlpatterns += url(r'^__debug__/', include(debug_toolbar_urls)),
