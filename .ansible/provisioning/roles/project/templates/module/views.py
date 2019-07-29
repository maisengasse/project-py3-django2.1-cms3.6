import datetime
from django.http import HttpResponseNotFound, HttpResponseRedirect
from django.utils.translation import ugettext_lazy as _
from django.template import RequestContext
from django.template.loader import render_to_string
from django.shortcuts import render, get_object_or_404
from django.urls import reverse
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth import login as djangologin
from django.conf import settings
from django.core.paginator import Paginator, EmptyPage

from {{ project_name }}.{{ item[0].module_name }}.models import {{ item[0].model_class }}

from maisen.cmstools.internallinks import internalmodelinstancelinks_factory
Internal{{ item[0].model_class }}Links = internalmodelinstancelinks_factory({{ item[0].model_class }})

{% if item[0].detailpage %}
def {{ item[0].module_name }}_preview(request, id):
    item = get_object_or_404({{ item[0].model_class }}, id=id)
    return render(request, '{{ item[0].module_name }}/{{ item[0].module_name }}_detail.html', locals())
{% endif %}

{% if item[0].detailpage %}
def {{ item[0].module_name }}_detail(request, slug):
    item = get_object_or_404({{ item[0].model_class }}.objects.current(), slug=slug)
    return render(request, '{{ item[0].module_name }}/{{ item[0].module_name }}_detail.html', locals())
{% endif %}

def {{ item[0].module_name }}_list(request):
    items = {{ item[0].model_class }}.objects.current()
    # page = request.GET.get('seite', 1)
    # pager = Paginator(items, 20)

    # try:
    #     current_page = pager.page(page)
    # except (EmptyPage,) as e:
    #     return HttpResponseRedirect(request.path)

    return render(request, '{{ item[0].module_name }}/{{ item[0].module_name }}_list.html', locals())
