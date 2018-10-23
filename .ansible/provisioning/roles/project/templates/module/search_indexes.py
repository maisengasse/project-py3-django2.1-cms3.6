import datetime
from haystack import indexes
from {{ project_name }}.{{ item[0].module_name }}.models import {{ item[0].model_class }}

class {{ item[0].model_class }}Index(indexes.SearchIndex, indexes.Indexable):
    text = indexes.CharField(document=True, use_template=True)

    def get_model(self):
        return {{ item[0].model_class }}

    def index_queryset(self, using=None):
        return {{ item[0].model_class }}.objects.current()
