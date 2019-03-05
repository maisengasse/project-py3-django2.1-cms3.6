from django.conf import settings
from django.contrib.sitemaps import Sitemap
from {{ project_name }}.{{ item[0].module_name }}.models import {{ item[0].model_class }}

class {{ item[0].model_class }}Sitemap(Sitemap):
    changefreq = "weekly"
    priority = 0.6

    def items(self):
        return {{ item[0].model_class }}.objects.current()

    def lastmod(self, obj):
        return obj.modified

{% if item[0].categorized %}
class {{ item[0].model_class }}CategorySitemap(Sitemap):
    changefreq = "weekly"
    priority = 0.6

    def items(self):
        return {{ item[0].model_class }}Category.objects.all()

    def lastmod(self, obj):
        return obj.modified
{% endif %}



