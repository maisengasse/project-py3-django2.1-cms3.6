# -*- coding: utf-8 -*-
from django.urls import reverse
from django.utils.translation import ugettext_lazy as _
from cms.api import get_page_draft
from cms.toolbar_pool import toolbar_pool
from cms.toolbar.items import Break
from cms.toolbar_base import CMSToolbar
from cms.cms_toolbars import ADMIN_MENU_IDENTIFIER, ADMINISTRATION_BREAK


@toolbar_pool.register
class NewsletterToolbar(CMSToolbar):
    def populate(self):
        admin_menu = self.toolbar.get_or_create_menu(ADMIN_MENU_IDENTIFIER)
        module_menu = self.toolbar.get_or_create_menu('maisen.modules', _('Module'))

        position = module_menu.find_first(Break, identifier='mediapool-break')
        menu = module_menu.get_or_create_menu('newsletter-menu', _(u'Newsletter'), position=position)
        url = reverse('admin:newsletter_newsletter_add')
        menu.add_modal_item(_(u'Neuer Newsletter'), url=url)
        menu.add_break('news-admin-break',)
        url = reverse('admin:newsletter_newsletter_changelist')
        menu.add_sideframe_item(_(u'Newsletter'), url=url)
        url = reverse('admin:newsletter_contact_changelist')
        menu.add_sideframe_item(_(u'Kontakte'), url=url, position=2)
        url = reverse('admin:newsletter_mailinglist_changelist')
        menu.add_sideframe_item(_(u'Listen'), url=url, position=2)
