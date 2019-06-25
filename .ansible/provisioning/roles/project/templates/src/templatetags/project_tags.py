# -*- coding: utf-8 -*-
import math, datetime, re
from bs4 import BeautifulSoup
from django import template
from filer.models import Image, File
from django.conf import settings
from django.utils.safestring import mark_safe
from maisen.cmstools.utils import render_string
from maisen.cmstools.filerpool.models import RemoteFilerImage
from maisen.cmstools.templatetags.cmstools_tags import striptags2
from maisen.cmstools.filerpool.templatetags.imagesize_tags import sizeurl
from maisen.cmstools.utils import slugify

register = template.Library()


@register.filter
def sourcecode(value, mobile=False):
    # if value.strip().startswith('<iframe'):
    #     if is_youtube_video(value) or is_vimeo_video(value):
    #         ratio = "%.0f" % ((float(9) / 16) * 100)
    #         wrapper = """<div class="iframe-wrapper"
    #                           style="height: 0px;
    #                                  padding-bottom:%s%%">%s</div>"""
    #         return mark_safe(wrapper % (ratio, value))
    return mark_safe(value)


@register.filter
def richtext(value):
    if not value:
        return ""

    soup = BeautifulSoup(value, 'html.parser')

    # for table in soup.findAll('table'):
    #     #remove table attrs
    #     for attr in ('width', 'style',
    #                  'cellspacing', 'cellpadding',
    #                  'border', 'align'):
    #         if table.get(attr):
    #             del(table[attr]);

    # link titles
    for a in soup.findAll('a'):
        if not a.get('title'):
            a['title'] = a.text

    return mark_safe(str(soup))



@register.simple_tag(takes_context=True)
def seo_description(context, default=""):
    desc = default
    if context.get('seo_description'):
        desc = striptags2(context['seo_description'])
    else:
        tpl = "{{ '{%' }} load cms_tags{{ '%}' }}{{ '{%' }} page_attribute 'meta_description' {{ '%}' }}"
        d = render_string(tpl, context)
        if d and d != u'None':
            desc = d
    return desc


@register.simple_tag(takes_context=True)
def seo_title(context, suffix="", default=""):
    title = default
    if context.get('seo_title'):
        title = context['seo_title']
    else:
        tpl = "{{ '{%' }} load cms_tags{{ '%}' }}{{ '{%' }} page_attribute 'page_title' {{ '%}' }}"
        t = render_string(tpl, context)
        if t and t != u'None':
            title = t
    return title + suffix


@register.simple_tag(takes_context=True)
def seo_image(context):
    if context.get('seo_image'):
        image = context['seo_image']
    else:
        image = Image.objects.get(id=settings.DEFAULT_SEO_IMAGE)
    return sizeurl(image, 'ogimage')


@register.simple_tag(takes_context=True)
def i18ncaption(context, relation, default="", prop="caption"):
    i18nprop = prop
    lang = context['request'].LANGUAGE_CODE
    if lang != 'de':
        i18nprop = prop+'_'+lang
    val = relation.get(i18nprop)
    if not val:
        val = relation.get(prop)
    return mark_safe(val or default)
