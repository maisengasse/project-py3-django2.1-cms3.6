from django.conf import settings
from django.utils.translation import ugettext_lazy as _
from cms.plugin_pool import plugin_pool
from maisen.cmstools.stencils.cms_plugins import StencilBase, StencilPlugin
from maisen.cmstools.stencils.models import StencilData, StencilSlider
from maisen.cmstools.workflows.models import handle_plugin_workflow


class Grouper(StencilPlugin):
    name = _("Gruppe")
    render_template = "stencils/grouper.html"
    fields = ['title',('link','link_label'), 'container',]
    allow_children = True
    child_classes = []
    child_config = {}

plugin_pool.register_plugin(Grouper)


class Slider(StencilBase):
    model = StencilSlider
    name = _("Slider")
    child_classes = [c for c in settings.STENCILS_ENABLED if c != 'Slider']
    render_template = "stencils/slider.html"
    fields = ['title','dots', 'arrows', 'show',]
    allow_children = True

    def get_form(self, *args, **kw):
        return super(Slider, self).get_form(*args, **kw)

    def render(self, context, instance, placeholder):
        handle_plugin_workflow(self, context, instance, placeholder)
        context.update(locals())
        return context

plugin_pool.register_plugin(Slider)

class FullText(StencilPlugin):
    name = _("Text volle Breite")
    render_template = "stencils/fulltext.html"
    fields = ['title', 'body', 'display', 'container', ]
    display_choices = [
        ('1-col', _('1 Textspalte')),
        ('2-cols', _('2 Textspalten')),
        ('3-cols', _('3 Textspalten')),
        ('4-cols', _('3 Textspalten')),
    ]

plugin_pool.register_plugin(FullText)

class FullImage(StencilPlugin):
    name = _("Vollbild")
    render_template = "stencils/fullimage.html"
    fields = ['title', 'images', 'caption', 'ratio', ]

plugin_pool.register_plugin(FullImage)


class FullImageWithText(StencilPlugin):
    name = _("Vollbild mit Text")
    render_template = "stencils/fullimage-with-text.html"
    fields = ['title', 'body', 'images', 'caption', 'ratio', 'display', 'container',]
    display_choices = [
        ('left', _('Text Links')),
        ('right', _('Text Rechts')),
    ]

plugin_pool.register_plugin(FullImageWithText)


class ImageWithText(StencilPlugin):
    name = _("Bild mit Text")
    render_template = "stencils/image-with-text.html"
    fields = ['title', 'body', 'images', 'caption', 'ratio', 'display', 'container', ]
    display_choices = [
        ('left', _('Bild Links')),
        ('right', _('Bild Rechts')),
    ]

plugin_pool.register_plugin(ImageWithText)


class CodeWithText(StencilPlugin):
    name = _("Code mit Text")
    render_template = "stencils/code-with-text.html"
    fields = ['title', 'body', 'code', 'caption', 'ratio', 'display', 'container', ]
    display_choices = [
        ('left', _('Code Links')),
        ('right', _('Code Rechts')),
    ]

plugin_pool.register_plugin(CodeWithText)


class FullImageWithColumnText(StencilPlugin):
    name = _("Vollbild mit Textspalten")
    render_template = "stencils/fullimage-with-columntext.html"
    fields = ['title', 'images', 'caption', 'ratio', 'container',]
    allow_children = True
    child_classes=['ColumnText',]
    child_config = {
        'ColumnText' : {
            'amount' : 2,
            'initial' : {
                'title' : 'Textspalte',
                'body' : '<p>Textspalten-Text<p>',
            }
        }
    }

plugin_pool.register_plugin(FullImageWithColumnText)

class ColumnText(StencilPlugin):
    name = _("Textspalte")
    render_template = "stencils/columntext.html"
    fields = ['title', 'body',]

plugin_pool.register_plugin(ColumnText)


class TeaserGroup(StencilPlugin):
    name = _("Teaser-Gruppe")
    render_template = "stencils/teaser-group.html"
    allow_children = True
    child_classes=['Teaser',]
    child_config = {
        'Teaser' : {
            'amount' : 3,
            'initial' : {
                'title' : 'Teaser',
                'body' : '<p>Teaser-Text<p>',
                'link' : '/',
                'images' : [{ 'id' : settings.PLACEHOLDER_IMAGE_ID }]
            }
        }
    }

    fields = ['title',('link','link_label'), 'container', ]

plugin_pool.register_plugin(TeaserGroup)


class Teaser(StencilPlugin):
    name = _("Teaser")
    render_template = "stencils/teaser.html"
    fields = ['title','body','images', 'ratio', 'link']
plugin_pool.register_plugin(Teaser)


class HighlightGroup(StencilPlugin):
    name = _("Highlights")
    render_template = "stencils/highlight-group.html"
    allow_children = True
    child_classes=['Highlight',]
    child_config = {
        'Highlight' : {
            'amount' : 4,
            'initial' : {
                'title' : 'Highlight',
                'body' : '<p>Hightlight-Text<p>',
                'cssclass' : ''
            }
        }
    }
    fields = ['title',('link','link_label'), 'container', ]

plugin_pool.register_plugin(HighlightGroup)


class Highlight(StencilPlugin):
    name = _("Highlight")
    render_template = "stencils/highlight.html"
    fields = ['title', 'body', 'files', 'container',]

plugin_pool.register_plugin(Highlight)


class Testimonial(StencilPlugin):
    name = _("Testimonial")
    render_template = "stencils/testimonial.html"
    fields = ['title', 'body', 'files', 'container']

plugin_pool.register_plugin(Testimonial)



class Timeline(StencilPlugin):
    name = _("Timeline")
    render_template = "stencils/timeline.html"
    allow_children = True
    child_classes = ["TimelineEntryPlugin"]
    fields = ["title", "container"]

    def render(self, context, instance, placeholder):
        context.update(locals())
        return context


plugin_pool.register_plugin(Timeline)


class TimelineEntryPlugin(StencilPlugin):
    name = _("Timeline-Eintrag")
    fields = ["title", "body"]
    render_template = "stencils/timeline-entry.html"

    def render(self, context, instance, placeholder):
        context.update(locals())
        return context


plugin_pool.register_plugin(TimelineEntryPlugin)
