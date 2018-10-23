# -*- coding: utf-8 -*-
import math, datetime, re
from django import template
from django.conf import settings
from django.utils.safestring import mark_safe
from maisen.cmstools.utils import render_string
from maisen.cmstools.videotools import is_youtube_video, is_vimeo_video
from maisen.cmstools.filerpool.templatetags.imagesize_tags import sizeurl

register = template.Library()


@register.filter
def sourcecode(value, mobile=False):
    if value.strip().startswith('<iframe'):
        if is_youtube_video(value) or is_vimeo_video(value):
            ratio = "%.0f" % ((float(9) / 16) * 100)
            wrapper = """<div class="iframe-wrapper"
                              style="height: 0px;
                                     padding-bottom:%s%%">%s</div>"""
            return mark_safe(wrapper % (ratio, value))
    return mark_safe(value)


@register.filter
def richtext(value):
    if not value:
        return ""
    return mark_safe(value)

    # soup = BeautifulSoup(value)
    # for table in soup.findAll('table'):
    #     #remove table attrs
    #     for attr in ('width', 'style',
    #                  'cellspacing', 'cellpadding',
    #                  'border', 'align'):
    #         if table.get(attr):
    #             del(table[attr]);

    #     for i, tr in enumerate(table.findAll('tr')):
    #         # tr['class'] = "row%s %s" % (i+1, (i+1) % 2 and 'odd' or 'even')
    #         tds = tr.findAll('td');
    #         for j, td in enumerate(tds):
    #             cw = 100.0/(len(tds))
    #             td['style'] = "width:%.1f%%" % cw
    #             # if 'tabelle-jahre' in table.get('class', ""):
    #             #     del(td['style'])
    #             # else:
    #             # td['class'] = "col%s %s" % (j+1, (j+1) % 2 and 'odd' or 'even')
    # return mark_safe(soup.renderContents())


@register.simple_tag(takes_context=True)
def seo_description(context, default=""):
    desc = default
    if context.get('page_description'):
        desc = context['page_description']
    else:
        tpl = "{{ '{%' }} load cms_tags{{ '%}' }}{{ '{%' }} page_attribute 'meta_description' {{ '%}' }}"
        d = render_string(tpl, context)
        if d != u'None' or not d:
            desc = d
    return desc


@register.simple_tag(takes_context=True)
def seo_title(context, suffix="", default=""):
    title = default
    if context.get('page_title'):
        title = context['page_title']
    else:
        tpl = "{{ '{%' }} load cms_tags{{ '%}' }}{{ '{%' }} page_attribute 'page_title' {{ '%}' }}"
        t = render_string(tpl, context)
        if t != u'None' or not t:
            title = t
    return title + suffix

@register.simple_tag(takes_context=True)
def seo_image(context):
    if context.get('page_image'):
        image = context['page_image']
        return settings.PORTAL_URL + sizeurl(image, 'fleximage')
    return ""
