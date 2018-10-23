import datetime
from haystack import indexes
from cms.models import Page

# from {{ project_name }}.news.models import Newsitem, get_current_news

class CmsPageIndex(indexes.SearchIndex, indexes.Indexable):
    text = indexes.CharField(document=True, use_template=True)

    def get_model(self):
        return Page

    def index_queryset(self, using=None):
        """Used when the entire index for model is updated."""
        return self.get_model().objects.published().on_site()


# class NewsitemIndex(indexes.SearchIndex, indexes.Indexable):
#     text = indexes.CharField(document=True, use_template=True)

#     def get_model(self):
#         return Newsitem

#     def index_queryset(self, using=None):
#         return get_current_news()
