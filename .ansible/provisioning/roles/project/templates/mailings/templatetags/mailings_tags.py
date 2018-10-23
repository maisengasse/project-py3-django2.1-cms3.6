from htmlentitydefs import name2codepoint
# for some reason, python 2.5.2 doesn't have this one (apostrophe)
name2codepoint['#39'] = 39
import re
from bs4 import BeautifulSoup
from django import template
from django.template.defaultfilters import striptags

register = template.Library()

def unescape(s):
    "unescape HTML code refs; c.f. http://wiki.python.org/moin/EscapingHtml"
    return re.sub('&(%s);' % '|'.join(name2codepoint),
              lambda m: unichr(name2codepoint[m.group(1)]), s)

@register.filter
def plaintext(value):
    return unescape(striptags(value))

def _htmltext(value, elements={}):
    ELEMENTS = dict(
        B = """<b style="font-weight: bold;">%s</b>""",
        A = """<a target="_blank" style="color:#87878A; text-transform: uppercase; text-decoration:underline" href="%s">%s</a>""",
        EM = """<em style="font-style:italic">%s</em>""",
        BR = """<br />""",
        SPAN = """<span style="%s">%s</span>""",
        STRONG = """<b style="%s">%s</b>""",
        CSS_CLASS_TO_COLOR = {
            'ig-blau' : '#0069B8',
            'airabc-gruen' : '#99B719',
            'mrwt-rot' : '#960F24'
        },
    )
    ELEMENTS.update(elements)
    story = []
    soup = BeautifulSoup(value)
    # import pdb; pdb.set_trace()
    for wrapper in soup.contents:
        if hasattr(wrapper, 'name'):
            style = dict(wrapper.attrs).get('style', None)
            if style:
                story.append('<div style="%s">' % style)
            for content in wrapper.contents:
                if hasattr(content, 'name'):
                    if content.name == 'strong':
                        color = ELEMENTS['CSS_CLASS_TO_COLOR'].get(dict(content.attrs).get('class', None), None)
                        if color:
                            story.append(ELEMENTS['STRONG'] % ('color:'+color,
                                                               content.renderContents()))
                        else:
                            story.append(ELEMENTS['B'] % content.renderContents())
                    elif content.name == 'a':
                        url = dict(content.attrs).get('href', "");
                        story.append(ELEMENTS['A'] % (url, content.renderContents()))
                    elif content.name == "em":
                        story.append(ELEMENTS['EM'] % content.renderContents())
                    elif content.name == "br":
                        story.append(ELEMENTS['BR'])
                    elif content.name in ("strong", "span"):
                        color = ELEMENTS['CSS_CLASS_TO_COLOR'].get(dict(content.attrs).get('class', None), None)
                        if color:
                            story.append(ELEMENTS[content.name.upper()] % ('color:'+color,
                                                  content.renderContents()))
                        else:
                            story.append(content.renderContents())
                else:
                    story.append(content)

            if style:
                story.append('</div>')
            elif wrapper.name == 'p':
                story.append(ELEMENTS['BR'])

    #remove breaks at the end
    if story and story[-1] == ELEMENTS['BR']:
        story = story[:-1]

    return u'\n'.join(story);

@register.filter
def htmltext(value):
    html = _htmltext(value)
    html = html.replace('</b>\n', '</b>')
    return html
