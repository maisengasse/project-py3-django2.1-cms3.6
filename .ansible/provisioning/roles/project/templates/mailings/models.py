import datetime, glob, os
from django.db import models
from django.urls import reverse
from django.utils.translation import ugettext_lazy as _
from django.conf import settings

from cms.models import CMSPlugin
from cms.models.fields import PlaceholderField
from emencia.django.newsletter.models import Newsletter, Contact, MailingList

from maisen.cmstools.filerpool.fields import PhotoPoolField, PhotoPoolImageField
# from {{ project_name }}.news.models import Newsitem

class Mailing(models.Model):
    class Meta:
        verbose_name = _(u'Mailing')
        verbose_name_plural = _(u'Mailing')


    newsletter = models.OneToOneField(Newsletter, verbose_name=_('Newsletter'), related_name="mailing")
    header = PlaceholderField('nl_header', related_name='header')
    contents = PlaceholderField('nl_contents', related_name="contents")

    def get_absolute_url(self):
        return reverse('newsletter:show_mailing', args=[self.newsletter.slug,])

    def get_date(self):
        return datetime.datetime.now()



#Plugins ###############################################################################
# class NewsTeaser(CMSPlugin):
#     class Meta:
#         verbose_name = _(u'News-Artikel')
#         verbose_name_plural = _(u'News-Artikel')

#     newsitem = models.ForeignKey(Newsitem, verbose_name=_('Newseintrag'), related_name="nlteasers", on_delete=models.PROTECT)
#     title = models.CharField(verbose_name=_('Titel'), max_length=255, null=True, blank=True)
#     body = models.TextField(verbose_name=_('Haupttext'), null=True, blank=True)
#     image = PhotoPoolImageField(_('Bild'), null=True, blank=True)
#     link = models.CharField(verbose_name =_(u'Externer Link'), null=True, blank=True, max_length=255)
#     display = models.CharField(verbose_name=_("Darstellung"), choices=settings.FLEX_TEXTIMAGE_DISPLAYS, max_length=255, null=True, blank=True)

#     @property
#     def button_link(self):
#         return self.newsitem.get_absolute_url()

#     def get_icon_url(self):
#         return None

#     def __unicode__(self):
#         return "NewsTeaser: %s" % self.title or self.newsitem.title

#     def _convert_plugins(self, placeholder):
#         html = u""
#         # for plugin in placeholder.cmsplugin_set.all():
#         #     instance = plugin.get_plugin_instance()[0]
#         #     if isinstance(instance, FlexText):
#         #         if instance.title:
#         #             html += u"<h3>%s</h3>" % instance.title
#         #         if instance.body:
#         #             try:
#         #                 html += richtext(subtitle(maintitle(instance.body, 'h2'), 'h3'))
#         #             except (UnicodeDecodeError,) as e:
#         #                 html += u"<p><b>Fehler beim Konvertieren von '%s':</b> %s</p>" % (instance, e)
#         return html

#     def save(self, *args, **kw):
#         if not self.title:
#             self.title = self.newsitem.title
#         if not self.image.image:
#             self.image = self.newsitem.image
#         if not self.body:
#             html = self.newsitem.description
#             html += self._convert_plugins(self.newsitem.content)
#             self.body = html
#         return super(NewsTeaser, self).save(*args, **kw)
