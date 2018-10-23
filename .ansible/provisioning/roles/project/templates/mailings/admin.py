# -*- coding: utf-8 -*-
from django import forms
from django.contrib import admin
from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.utils.translation import ugettext_lazy as _
from cms.admin.placeholderadmin import PlaceholderAdminMixin
from emencia.django.newsletter.models import Newsletter
from emencia.django.newsletter.admin import NewsletterAdmin as DefaultNewsletterAdmin

from models import Mailing


NEWSLETTER_MCE_ATTRS = {
    'theme_advanced_buttons1' : "formatselect,bold,italic,underline,|,link,unlink,|,image,|,code",
    'theme_advanced_buttons2' : "tablecontrols,",
    'theme_advanced_blockformats' : 'h4,p',
    'external_image_list_url' : '/imagelist.js',
    'remove_script_host' : False,
    'relative_urls' : False
}

class MailingAdminForm(forms.ModelForm):
    class Meta:
        model = Mailing
        fields = "__all__"

class MailingAdmin(PlaceholderAdminMixin, admin.ModelAdmin):
    pass


class MailingInline(admin.StackedInline):
    model = Mailing
    extra = 1
    max_num = 1


class NewsletterAdmin(DefaultNewsletterAdmin):
    list_display = ('title', 'mailing_list', 'status',
                    'sending_date',
                    'preview_link',
                    'historic_link', 'statistics_link')
    list_filter = ()
    fieldsets = ((None, {'fields': ('title','slug')}),
                 (_('Receivers'), {'fields': ('mailing_list', 'test_contacts',)}),
                 (_('Sending'), {'fields': ('sending_date', 'status',)}),
                 (_('Miscellaneous'), {'fields': ('server', 'header_sender',
                                                  'header_reply'),
                                       'classes': ('collapse',)}),
                 )
    prepopulated_fields = {"slug": ("title",)}
    inlines = (MailingInline,)

    def preview_link(self, instance):
        return """<a href="%s" target="_blank">Editieren</a>""" % instance.mailing.get_absolute_url()
    preview_link.short_description = "Editieren"
    preview_link.allow_tags = True;

    def save_model(self, *args, **kw):
        super(NewsletterAdmin, self).save_model(*args, **kw)
        instance = args[1]

        try:
            mailing = instance.mailing
        except Mailing.DoesNotExist:
            mailing = Mailing(newsletter=instance)
            mailing.save()


admin.site.unregister(Newsletter)
admin.site.register(Newsletter, NewsletterAdmin)
admin.site.register(Mailing, MailingAdmin)
