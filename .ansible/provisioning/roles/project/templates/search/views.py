# import datetime
from django.http import Http404
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.core.paginator import Paginator, InvalidPage
from haystack.forms import ModelSearchForm, HighlightedModelSearchForm
from haystack.query import EmptySearchQuerySet

def livesearch(request):
    return search(request, template="search/live.html", results_per_page=10)

def search(request, template='search/search.html', results_per_page=20):
    query = ''
    results = EmptySearchQuerySet()
    form_class = HighlightedModelSearchForm
    searchqueryset = EmptySearchQuerySet
    load_all = True
    if request.GET.get('q'):
        form = form_class(request.GET, load_all=load_all)

        if form.is_valid():
            query = form.cleaned_data['q']
            results = form.search()
    else:
        form = form_class(request.GET, searchqueryset=searchqueryset, load_all=load_all)

    paginator = Paginator(results, results_per_page)

    try:
        page = paginator.page(int(request.GET.get('page', 1)))
    except InvalidPage:
        raise Http404("No such page of results!")

    context = {
        'form': form,
        'page': page,
        'paginator': paginator,
        'query': query,
        'suggestion': None,
    }

    if results.query.backend.include_spelling:
        context['suggestion'] = form.get_suggestion()

    return render_to_response(template, context, context_instance=RequestContext(request))
