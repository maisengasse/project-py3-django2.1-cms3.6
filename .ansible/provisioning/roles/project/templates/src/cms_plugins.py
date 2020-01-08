from django.conf import settings
from django.utils.translation import ugettext_lazy as _
from cms.plugin_pool import plugin_pool
from maisen.cmstools.filerpool.utils import get_size_url
from maisen.cmstools.stencils.cms_plugins import StencilBase, StencilPlugin
from maisen.cmstools.stencils.models import StencilData, StencilSlider
from maisen.cmstools.workflows.models import handle_plugin_workflow


class Slider(StencilBase):
    model = StencilSlider
    name = _("Slider")
    child_classes = [c for c in settings.STENCILS_ENABLED if c != "Slider"]
    render_template = "stencils/slider.html"
    fields = ["title", "dots", "arrows", "show"]
    allow_children = True

    def get_form(self, *args, **kw):
        return super(Slider, self).get_form(*args, **kw)

    def render(self, context, instance, placeholder):
        handle_plugin_workflow(self, context, instance, placeholder)
        context.update(locals())
        return context


plugin_pool.register_plugin(Slider)


class Grouper(StencilPlugin):
    name = _("Gruppe")
    render_template = "stencils/grouper.html"
    fields = ["title", ("link", "link_label"), "container"]
    allow_children = True
    child_classes = []
    child_config = {}


plugin_pool.register_plugin(Grouper)


class FullText(StencilPlugin):
    name = _("Text volle Breite")
    render_template = "stencils/fulltext.html"
    fields = ["title", "body", "display", "container"]
    display_choices = [
        ("1-col", _("1 Textspalte")),
        ("2-cols", _("2 Textspalten")),
        ("3-cols", _("3 Textspalten")),
        ("4-cols", _("3 Textspalten")),
    ]


plugin_pool.register_plugin(FullText)


class FullImage(StencilPlugin):
    name = _("Bild volle Breite")
    render_template = "stencils/fullimage.html"
    fields = ["title", "images", "caption", "ratio", "container"]


plugin_pool.register_plugin(FullImage)


class FullImageWithText(StencilPlugin):
    name = _("Bild volle Breite mit Text")
    render_template = "stencils/fullimage-with-text.html"
    fields = ["title", "body", "images", "caption", "ratio", "display", "container"]
    display_choices = [("left", _("Text Links")), ("right", _("Text Rechts"))]


plugin_pool.register_plugin(FullImageWithText)


class FullImageWithColumnText(StencilPlugin):
    name = _("Bild volle Breite mit Textspalten")
    render_template = "stencils/fullimage-with-columntext.html"
    fields = ["title", "images", "caption", "ratio", "container"]
    allow_children = True
    child_classes = ["ColumnText"]
    child_config = {
        "ColumnText": {
            "amount": 2,
            "initial": {"title": "Textspalte", "body": "<p>Textspalten-Text<p>"},
        }
    }


plugin_pool.register_plugin(FullImageWithColumnText)


class ColumnText(StencilPlugin):
    name = _("Textspalte")
    render_template = "stencils/columntext.html"
    fields = ["title", "body"]


plugin_pool.register_plugin(ColumnText)


class FullVideo(StencilPlugin):
    name = _("Video volle Breite")
    render_template = "stencils/fullvideo.html"
    fields = ["title", "code", "files", "images", "container"]
    form_labels = {
        "files": _("Local Video Files"),
        "code": _("YouTube / Vimeo Embed Code"),
        "images": _("Poster Image"),
    }
    form_help_texts = {
        "files" : _("codec: h264, resolution ~720p, bitrate <3000K, faststart optimized"),
        "code" : _('as provided by YouTube / Vimeo')
    }

    def render(self, context, instance, placeholder):
        is_embed_video = "youtube" in instance.code or "vimeo" in instance.code
        try:
            if instance.images:
                poster = get_size_url(instance.images.image, "fullhd")
        except TypeError:
            pass

        context.update(locals())
        return context


plugin_pool.register_plugin(FullVideo)


class ImageWithText(StencilPlugin):
    name = _("Bild mit Text")
    render_template = "stencils/image-with-text.html"
    fields = ["title", "body", "images", "caption", "ratio", "display", "container"]
    display_choices = [("left", _("Bild Links")), ("right", _("Bild Rechts"))]


plugin_pool.register_plugin(ImageWithText)


class ImageGallery(StencilPlugin):
    name = _("Bildergalerie")
    render_template = "stencils/image-gallery.html"
    fields = ["title", "images", "container"]


plugin_pool.register_plugin(ImageGallery)


class VideoWithText(StencilPlugin):
    name = _("Video mit Text")
    render_template = "stencils/video-with-text.html"
    fields = ["title", "body", "code", "files", "images", "display", "container"]
    display_choices = [("left", _("Video Links")), ("right", _("Video Rechts"))]
    form_labels = {
        "files": _("Local Video Files"),
        "code": _("YouTube / Vimeo Embed Code"),
        "images": _("Poster Image"),
    }
    form_help_texts = {
        "files" : _("codec: h264, resolution ~720p, bitrate <3000K, faststart optimized"),
        "code" : _('as provided by YouTube / Vimeo')
    }

    def render(self, context, instance, placeholder):
        is_embed_video = "youtube" in instance.code or "vimeo" in instance.code
        try:
            if instance.images:
                poster = get_size_url(instance.images.image, "fullhd")
        except TypeError:
            pass

        context.update(locals())
        return context


plugin_pool.register_plugin(VideoWithText)


class HighlightGroup(StencilPlugin):
    name = _("Highlight Gruppe")
    render_template = "stencils/highlight-group.html"
    allow_children = True
    child_classes = ["Highlight"]
    child_config = {
        "Highlight": {
            "amount": 4,
            "initial": {
                "title": "Highlight",
                "body": "<p>Highlight-Text<p>",
                "files": [{"id": settings.PLACEHOLDER_ICON_ID}],
            },
        }
    }
    fields = ["title", ("link", "link_label"), "container"]


plugin_pool.register_plugin(HighlightGroup)


class Highlight(StencilPlugin):
    name = _("Highlight")
    render_template = "stencils/highlight.html"
    fields = ["title", "body", "files", "container"]


plugin_pool.register_plugin(Highlight)


class TeaserGroup(StencilPlugin):
    name = _("Teaser Gruppe")
    render_template = "stencils/teaser-group.html"
    allow_children = True
    child_classes = ["Teaser"]
    child_config = {
        "Teaser": {
            "amount": 3,
            "initial": {
                "title": "Teaser",
                "body": "<p>Teaser-Text<p>",
                "link": "/",
                "images": [{"id": settings.PLACEHOLDER_IMAGE_ID}],
            },
        }
    }

    fields = ["title", ("link", "link_label"), "container"]


plugin_pool.register_plugin(TeaserGroup)


class Teaser(StencilPlugin):
    name = _("Teaser")
    render_template = "stencils/teaser.html"
    fields = ["title", "body", "images", "ratio", "link"]


plugin_pool.register_plugin(Teaser)


class TeamGroup(StencilPlugin):
    name = _("Team Gruppe")
    render_template = "stencils/team-group.html"
    allow_children = True
    child_classes = ["TeamMember"]
    child_config = {
        "TeamMember": {
            "amount": 3,
            "initial": {
                "title": "Name",
                "subtitle": "Jobtitel",
                "link": "/",
                "images": [{"id": settings.CONTACT_IMAGE_ID}],
            },
        }
    }

    fields = ["title", "container"]


plugin_pool.register_plugin(TeamGroup)


class TeamMember(StencilPlugin):
    name = _("Team Mitglied")
    render_template = "stencils/team-member.html"
    fields = ["title", "subtitle", "images", "link"]


plugin_pool.register_plugin(TeamMember)


class TimelineGroup(StencilPlugin):
    name = _("Timeline Gruppe")
    render_template = "stencils/timeline.html"
    allow_children = True
    child_classes = ["TimelineEntry"]
    fields = ["title", "container"]

    def render(self, context, instance, placeholder):
        context.update(locals())
        return context


plugin_pool.register_plugin(TimelineGroup)


class TimelineEntry(StencilPlugin):
    name = _("Timeline Eintrag")
    fields = ["title", "body"]
    render_template = "stencils/timeline-entry.html"

    def render(self, context, instance, placeholder):
        context.update(locals())
        return context


plugin_pool.register_plugin(TimelineEntry)


class Testimonial(StencilPlugin):
    name = _("Testimonial")
    render_template = "stencils/testimonial.html"
    fields = ["title", "body", "images", "container"]


plugin_pool.register_plugin(Testimonial)


class AccordionGroup(StencilPlugin):
    name = _("Accordion Gruppe")
    render_template = "stencils/accordion-group.html"
    allow_children = True
    child_classes = ["CollapsibleGroup"]
    child_config = {"CollapsibleGroup": {"amount": 2, "initial": {"title": "Name"}}}
    fields = ["title"]


plugin_pool.register_plugin(AccordionGroup)


class CollapsibleGroup(StencilPlugin):
    name = _("Collapsible Gruppe")
    render_template = "stencils/collapsible-group.html"
    allow_children = True
    child_classes = ["FullText"]
    fields = ["title"]


plugin_pool.register_plugin(CollapsibleGroup)