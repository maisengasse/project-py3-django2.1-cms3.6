# -*- coding: utf-8 -*-
from django.urls import reverse
from django.utils.translation import ugettext_lazy as _
from cms.toolbar_pool import toolbar_pool
from cms.extensions.toolbar import ExtensionToolbar
from cms.toolbar.items import Break
from cms.toolbar_base import CMSToolbar
from cms.cms_toolbars import ADMIN_MENU_IDENTIFIER, ADMINISTRATION_BREAK


@toolbar_pool.register
class StencilIconToolbar(CMSToolbar):
    class Media:
        css = {"all": ("{{ project_name }}/css/stencil-icons.css",)}


@toolbar_pool.register
class ModuleToolbar(CMSToolbar):
    def populate(self):
        module_menu = self.toolbar.get_or_create_menu("maisen.modules", _("Module"))

        #url = reverse("admin:cms_page_changelist")
        #module_menu.add_sideframe_item(_(u"Seitenbaum"), url=url, position=0)
        #module_menu.add_break("pagetree-break", position=1)

        url = reverse("admin:filer_folder_changelist")
        module_menu.add_sideframe_item(_(u"Medienpool"), url=url, position=2)
        module_menu.add_break("student-admin-break", position=3)

        url = "/admin/translate/"
        module_menu.add_sideframe_item(_("Übersetzungskatalog"), url=url, position=1)

@toolbar_pool.register
class SiteTree(CMSToolbar):
     def populate(self):
        url = reverse("admin:cms_page_changelist")
        sitetree_menu = self.toolbar.add_modal_item(_("Seitenbaum"), url=url)