from django.conf.urls import patterns, url, include
from {{ project_name }}.mailings import views

urlpatterns = [
    url(r'^mailing/([\w-]+)/$', views.show_mailing, name="show_mailing"),
    url(r'^anmelden/$', views.subscription_form, name="subscription_form"),
    url(r'^danke/$', views.subscription_thanks, name="subscription_thanks"),
    url(r'^bestaetigen/$', views.confirm_subscription, name="confirm_subscription"),
    url(r'^bestaetigt/$', views.confirm_subscription_thanks, name="confirm_subscription_thanks"),
    url(r'^abmelden/$', views.unsubscription_form, name="unsubscription_form"),
    url(r'^abgemeldet/$', views.unsubscription_thanks, name="unsubscription_thanks"),
]

