# -*- coding: utf-8 -*-
from django.urls import reverse
from django.utils.translation import ugettext_lazy as _
from cms.api import get_page_draft
from cms.toolbar_pool import toolbar_pool
from cms.cms_toolbars import PageToolbar
from cms.toolbar.items import Break
from cms.toolbar_base import CMSToolbar

@toolbar_pool.register
class {{ item[0].model_class }}Toolbar(CMSToolbar):
    def populate(self):

        module_menu = self.toolbar.get_or_create_menu('maisen.modules', _('Module'))
        position = module_menu.find_first(Break, identifier='mediapool-break')

        menu = module_menu.get_or_create_menu('{{ item[0].module_name }}-men', _('{{ item[0].model_name_plural }}'), position=position)
        url = reverse('admin:{{ item[0].module_name }}_{{ item[0].model_class|lower }}_add')
        menu.add_modal_item(_('Neu'), url=url)
        menu.add_break('{{ item[0].module_name }}-admin-break',)
        url = reverse('admin:{{ item[0].module_name }}_{{ item[0].model_class|lower }}_changelist')
        menu.add_sideframe_item(_('{{ item[0].model_name_plural }}'), url=url)
{% if item[0].categorized %}
        url = reverse('admin:{{ item[0].module_name }}_{{ item[0].model_class|lower }}category_changelist')
        menu.add_sideframe_item(_('{{ item[0].model_name }}-Kategorien'), url=url)
{% endif %}
