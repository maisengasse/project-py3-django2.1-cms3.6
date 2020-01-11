# -*- coding: utf-8 -*-
from cms.app_base import CMSApp
from django.conf.urls import url
from cms.apphook_pool import apphook_pool
from django.utils.translation import ugettext_lazy as _

from julianschwazer import views

class InquiryApphook(CMSApp):
    name = _(u'Anfrageformular')
    def get_urls(self, page=None, language=None, **kwargs):
        return [
            url(r'^$', views.inquiry_form, name="inquiry_form"),
            url(r'^danke/$', views.inquiry_form_thanks, name="inquiry_form_thanks"),
        ]
apphook_pool.register(InquiryApphook)
