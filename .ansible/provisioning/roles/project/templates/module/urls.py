from django.conf.urls import url
from {{ project_name }}.{{ item[0].module_name }} import views

urlpatterns = [
    url(r'^$', views.{{ item[0].module_name }}_list, name="{{ item[0].module_name }}_list"),
    {% if item[0].detailpage %}url(r'^([\w-]+)/$', views.{{ item[0].module_name }}_detail, name="{{ item[0].module_name }}_detail"),{% endif %}
    {% if item[0].previewpage %}url(r'^([\d-]+)/vorschau/$', views.{{ item[0].module_name }}_preview, name="{{ item[0].module_name }}_preview"),{% endif %}

]

