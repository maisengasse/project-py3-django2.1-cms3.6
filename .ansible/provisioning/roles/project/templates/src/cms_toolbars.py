# -*- coding: utf-8 -*-
from django.core.urlresolvers import reverse
from django.utils.translation import ugettext_lazy as _
from cms.toolbar_pool import toolbar_pool
from cms.extensions.toolbar import ExtensionToolbar
from cms.toolbar.items import Break
from cms.toolbar_base import CMSToolbar
from cms.cms_toolbars import ADMIN_MENU_IDENTIFIER, ADMINISTRATION_BREAK
# from {{ project_name }}.models import HeaderExtension

# @toolbar_pool.register
# class HeaderExtensionToolbar(ExtensionToolbar):
#     # defines the model for the current toolbar
#     model = HeaderExtension

#     def populate(self):
#         # setup the extension toolbar with permissions and sanity checks
#         current_page_menu = self._setup_extension_toolbar()
#         # if it's all ok
#         if current_page_menu:
#             # retrieves the instance of the current extension (if any) and the toolbar item URL
#             page_extension, url = self.get_page_extension_admin()
#             if url:
#                 # adds a toolbar item
#                 current_page_menu.add_modal_item(_(u'Headerbild'), url=url,
#                     disabled=not self.toolbar.edit_mode)


@toolbar_pool.register
class ModuleToolbar(CMSToolbar):
    def populate(self):
        module_menu = self.toolbar.get_or_create_menu('maisen.modules', _('Module'))

        url = reverse('admin:cms_page_changelist')
        module_menu.add_sideframe_item(_(u'Seitenbaum'), url=url, position=0)
        module_menu.add_break('pagetree-break', position=1)

        url = reverse('admin:filer_folder_changelist')
        module_menu.add_sideframe_item(_(u'Medienpool'), url=url, position=2)
        module_menu.add_break('student-admin-break', position=3)

