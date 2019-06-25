from django.contrib import admin
from django.db import models
from django import forms
from django.urls import reverse
from django.template.defaultfilters import slugify, striptags
from django.utils.translation import ugettext_lazy as _
from cms.extensions import PageExtensionAdmin
from cms.admin.placeholderadmin import PlaceholderAdminMixin
from reversion.admin import VersionAdmin

from maisen.cmstools.widgets import CKEditorWidget

# class HeaderExtensionAdmin(PageExtensionAdmin):
#     exclude = ('display',)

# admin.site.register(HeaderExtension, HeaderExtensionAdmin)
