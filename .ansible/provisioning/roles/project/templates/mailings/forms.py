# -*- coding: utf-8 -*-
from django import forms
from django.utils.translation import ugettext_lazy as _

class NewsletterSubscriptionForm(forms.Form):
    # salutation = forms.CharField(label=_('inquiry-salutation'))
    ok = forms.BooleanField(label=_(u'Ja, ich möchte regelmäßig Informationen und Neuigkeiten über den offiziellen Online-Newsletter erhalten!'))
    first_name = forms.CharField(label=_('Vorname'))
    last_name = forms.CharField(label=_('Nachname'))
    email = forms.EmailField(label=_('E-Mail-Adresse'))


class NewsletterUnsubscriptionForm(forms.Form):
    email = forms.EmailField(label=_('E-Mail-Adresse'))
    list = forms.IntegerField(required=False)
