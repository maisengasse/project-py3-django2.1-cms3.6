# -*- coding: utf-8 -*-
from django.utils.translation import ugettext_lazy as _
from django import forms
from cms.plugin_pool import plugin_pool
from cms.plugin_base import CMSPluginBase
from cms.models import CMSPlugin, Page
from maisen.cmstools.plugins.flex.models import FlexSection
from maisen.cmstools.plugins.flex.cms_plugins import FlexSectionPlugin, FlexTextPlugin, FlexTextImagePlugin, FlexImagePlugin
from maisen.cmstools.widgets import CKEditorWidget, CodeMirrorWidget, OptionalInternalLink

# from models import NewsTeaser

class NLTextPlugin(FlexTextPlugin):
    name = _('Text')
    render_template="mailings/plugins/nltext.html"

    def get_form(self, *args, **kw):
        form = super(NLTextPlugin, self).get_form(*args, **kw)
        self.inlines = []
        return form

plugin_pool.register_plugin(NLTextPlugin)

class NLTextImagePlugin(FlexTextImagePlugin):
    render_template="mailings/plugins/nltextimage.html"
    name = _('Text mit Bild')

    def get_form(self, *args, **kw):
        form = super(NLTextImagePlugin, self).get_form(*args, **kw)
        self.inlines = []
        return form


plugin_pool.register_plugin(NLTextImagePlugin)

class NLImagePlugin(FlexImagePlugin):
    name = _('Bild')
    render_template="mailings/plugins/nlimage.html"
    inlines = []

    def get_form(self, *args, **kw):
        form = super(NLImagePlugin, self).get_form(*args, **kw)
        self.inlines = []
        return form

plugin_pool.register_plugin(NLImagePlugin)



NLSECTION_CHILD_CONFIG = {
    "NLTextPlugin" : {
        'order' : 0,
        'label' : 'Text',
        'initial' : {
            'body' : u'<p>Inhaltstext, Inhaltstext, Inhaltstext</p>'
        }
    },
    "NLImagePlugin" : {
        'order' : 1,
        'label' : 'Bild',
        'initial' : {
            # 'title' : u'Bildtitel',
            # 'caption' : u'Bildunterschrift',
            'images' : [{ 'id' : 1 }]
        }
    },
    "NLTextImagePlugin" : {
        'order' : 3,
        'label' : 'Text mit Bild',
        'initial' : {
            'images' : [{ 'id' : 1 }],
            'body' : u'<p>Inhaltstext, Inhaltstext, Inhaltstext</p>'
        }
    },
}



class NLSectionPlugin(FlexSectionPlugin):
    name = _('Mehrspalter')
    render_template="mailings/plugins/nlsection.html"
    child_config = NLSECTION_CHILD_CONFIG
    child_classes = child_config.keys()
    inlines = []
    child_columns = 2
    _fieldsets = [
        (None, {
            'fields': ['title',],
        }),
    ]

    def get_fieldsets(self, request, obj=None, **kwargs):
        f = list(self._fieldsets)
        if not obj:
            f += [
                (_('Spalten'), {
                    'fields': ('column1', 'column2',),
                }),
            ]
        self.fieldsets = f
        return f

plugin_pool.register_plugin(NLSectionPlugin)


# class NewsTeaserPluginForm(forms.ModelForm):
#     class Meta:
#         model = NewsTeaser
#         exclude = ('link',)
#         widgets = {
#             'body' : CKEditorWidget()
#         }

# class NewsTeaserPlugin(CMSPluginBase):
#     model = NewsTeaser
#     form = NewsTeaserPluginForm
#     name =  _(u'News-Artikel')
#     render_template="mailings/plugins/nlnewsteaser.html"
#     admin_preview = False

#     def render(self, context, instance, placeholder):
#         context.update({
#             'instance': instance,
#             'placeholder': placeholder,
#         })
#         return context

# plugin_pool.register_plugin(NewsTeaserPlugin)
