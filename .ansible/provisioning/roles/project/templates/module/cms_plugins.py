from django import forms
from cms.plugin_pool import plugin_pool
from cms.plugin_base import CMSPluginBase
from django.utils.translation import ugettext_lazy as _
from cms.models import CMSPlugin
from maisen.cmstools.widgets import CKEditorWidget, OptionalInternalLink
{% if item[0].plugin %}
from models import {{ item[0].model_class }}, {{ item[0].model_class }}Teaser

class {{ item[0].model_class }}TeaserPlugin(CMSPluginBase):
    model = {{ item[0].model_class }}Teaser
    name = _("{{ item[0].model_name }}-Teaser")
    render_template = "plugins/{{ item[0].module_name }}_teaser.html"
    admin_preview = False

    def render(self, context, instance, placeholder):
        items = {{ item[0].model_class }}.objects.current()[:instance.count]
        context.update(locals())
        return context

plugin_pool.register_plugin({{ item[0].model_class }}TeaserPlugin)
{% endif %}
