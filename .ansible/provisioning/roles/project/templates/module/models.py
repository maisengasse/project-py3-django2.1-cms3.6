# -*- coding: utf-8 -*-
import datetime
from django.conf import settings
from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.template.defaultfilters import truncatewords_html, truncatewords
from django.urls import reverse
from autoslug import AutoSlugField
from filer.fields.file import FilerFileField
from cms.models.fields import PlaceholderField
from cms.models import CMSPlugin

from maisen.cmstools.models import DublinCore
from maisen.cmstools.filerpool.fields import PhotoPoolField

class {{ item[0].model_class }}QuerySet(models.QuerySet):
{% if item[0].publish_workflows %}
    def current(self):
        qboth = models.Q(valid_from__lte=datetime.datetime.now(),
                        valid_to__gte=datetime.datetime.now())
        qto = models.Q(valid_from__isnull=True,
                       valid_to__gte=datetime.datetime.now())
        qfrom = models.Q(valid_from__lte=datetime.datetime.now(),
                         valid_to__isnull=True)
        qnone = models.Q(valid_from__isnull=True,
                         valid_to__isnull=True)
        return self.filter(qboth | qto | qfrom | qnone).distinct()
{% else %}
    def current(self):
        return self.filter(published=True)
{% endif %}

{% if item[0].categorized %}
class {{ item[0].model_class }}Category(DublinCore):
    class Meta:
        verbose_name = _('{{ item[0].model_name }}-Kategorie')
        verbose_name_plural = _('{{ item[0].model_name }}-Kategorien')
        ordering = ('sort', 'title')
    sort = models.IntegerField(verbose_name=_('Sortierung'), default=2000)


{% endif %}
class {{ item[0].model_class }}(DublinCore):
    class Meta:
        verbose_name = _('{{ item[0].model_name }}')
        verbose_name_plural = _('{{ item[0].model_name_plural }}')
        ordering = ('sort', 'title')

    objects = {{ item[0].model_class }}QuerySet.as_manager()
    slug = AutoSlugField(populate_from='title', unique=True, editable=False)
    sort = models.IntegerField(verbose_name=_('Sortierung'), default=2000)
{% if item[0].publish_workflows %}
    valid_from = models.DateTimeField(verbose_name=_('verfügbar von'), null=True, blank=True)
    valid_to = models.DateTimeField(verbose_name=_('verfügbar bis'), null=True, blank=True)
{% else %}
    published = models.BooleanField(verbose_name=_('veröffentlicht'), default=True)
{% endif %}
{% if item[0].categorized %}

    category = models.ForeignKey({{ item[0].model_class }}Category, verbose_name=_("{{ item[0].model_name }}-Kategorie"), related_name="{{ item[0].module_name }}", on_delete=models.PROTECT)
{% endif %}

    images = PhotoPoolField(verbose_name=_('Bilder'), null=True, blank=True)
    details = PlaceholderField('details', related_name="{{ item[0].module_name }}_contents")

    def __str__(self):
        return self.title or self.description

{% if item[0].publish_workflows %}
    def is_currently_valid(self):
        iatz = datetime.datetime.now()
        if self.valid_from and self.valid_to:
            return self.valid_to >= iatz and self.valid_from <= iatz
        elif self.valid_from:
            return self.valid_from <= iatz
        elif self.valid_to:
            return self.valid_to >= iatz
        else:
            return True
{% endif %}

    def get_absolute_url(self):
{% if item[0].detailpage %}
        return reverse('{{ item[0].module_name }}_detail', args=[self.slug,])
{% else %}
        return '#'
{% endif %}

{% if item[0].plugin %}
### Plugins ###
class {{ item[0].model_class }}Teaser(CMSPlugin):
    class Meta:
        verbose_name = _('{{ item[0].model_name }}-Teaser')
        verbose_name_plural = _('{{ item[0].model_name }}-Teaser')

    col_css = "{{ item[0].module_name }}-teaser"
    title = models.CharField(verbose_name=_('Titel'), max_length=255, null=True, blank=True)
    count = models.IntegerField(verbose_name=_('Anzahl'), default=3)

    def __str__(self):
        return self.title or str(self.id)
{% endif %}
