from django.conf.urls import url

from {{ project_name }}.search import views
urlpatterns = [
    url(r'^live/$', views.livesearch, name="livesearch"),
    url(r'^$', views.search, name="search"),
]
