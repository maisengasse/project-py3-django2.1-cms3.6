from django import template
from django.template import Context
from sekizai.context import SekizaiContext
from django.utils.safestring import mark_safe
from maisen.cmstools.templatetags.cmstools_tags import striptags2, unescape
from django.core.urlresolvers import NoReverseMatch
from cms.plugin_rendering import render_plugins

register = template.Library()

@register.simple_tag
def index_plugins(placeholder):
    try:
        if placeholder:
            out = render_plugins(placeholder.cmsplugin_set.all(),
                                 SekizaiContext(),
                                 None)
            out = "\n".join(out)
        else:
            out = ""
    except (NoReverseMatch,):
        out = ""
    return mark_safe(unescape(striptags2(out)).strip())


@register.filter
def result_url(result):
    if result:
        try:
            return result.object.get_public_url()
        except (AttributeError,):
            return result.object.get_absolute_url()
    return ""

@register.filter
def result_title(result):
    if result:
        from cms.models import Page
        if isinstance(result.object, Page):
            title = result.object.get_title()
        else:
            title = result.object.title
        return u"%s (%s)" % (title, unicode(result.model._meta.verbose_name))
    return ""

@register.filter
def result_description(result):
    if result:
        from cms.models import Page
        if isinstance(result.object, Page):
            return result.text
        return result.object.description
    return ""
