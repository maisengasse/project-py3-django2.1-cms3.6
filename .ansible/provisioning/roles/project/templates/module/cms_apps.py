# -*- coding: utf-8 -*-
from cms.app_base import CMSApp
from cms.apphook_pool import apphook_pool
from django.utils.translation import ugettext_lazy as _

class {{ item[0].model_class }}Apphook(CMSApp):
    name = _('{{ item[0].model_name_plural }}')

    def get_urls(self, page=None, language=None, **kwargs):
        return ["{{ project_name }}.{{ item[0].module_name }}.urls"]


apphook_pool.register({{ item[0].model_class }}Apphook)

