# -*- coding: utf-8 -*-
import datetime
from django.conf import settings
from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.core.urlresolvers import reverse
from autoslug import AutoSlugField

from cms.extensions import PageExtension
from cms.extensions.extension_pool import extension_pool
from cms.models.fields import PlaceholderField

from maisen.cmstools.filerpool.fields import PhotoPoolImageField, PhotoPoolField
from maisen.cmstools.models import DublinCore
from maisen.cmstools.utils import render_string
from maisen.cmstools.sortable.models import Sortable

# class HeaderExtension(PageExtension):
#     class Meta:
#         verbose_name = _(u'Headerbild')
#         verbose_name_plural = _(u'Headerbilder')

#     DISPLAY_CHOICES = [
#         ('white', 'Weiss'),
#         ('black', 'Schwarz'),
#     ]

#     header = PhotoPoolImageField('Headerbild', null=True, blank=True)
#     display = models.CharField(verbose_name=_('Darstellung'), choices=DISPLAY_CHOICES, max_length=10, default='white')

#     def __unicode__(self):
#         return "Headerbild"

# extension_pool.register(HeaderExtension)
