# -*- coding: utf-8 -*-
import datetime
from django.conf import settings
from django import forms
from maisen.cmstools.mail import send_mail
from django.template.loader import render_to_string
from django.template import RequestContext
from django.shortcuts import render, get_object_or_404
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, Http404
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth.decorators import login_required
from django.utils.translation import ugettext_lazy as _
from maisen.cmstools.internallinks import internalmodelinstancelinks_factory
from maisen.cmstools.internallinks import InternalLinkHandler

@login_required
def home(request):
    return render(request, 'home.html', locals())

class InternalActionsLinks(InternalLinkHandler):
    key = "actions"
    ACTIONS = [
        # ('register', 'Registrierungs-Formular', lambda:reverse('accounts_register')),
        # ('login', u'Login-Formular', lambda:reverse('login')),
    ]

    ACTIONS_DICT = dict([(id, (label, url)) for id, label, url in ACTIONS])

    def resolve(self, id, **kw):
        try:
            url = self.ACTIONS_DICT.get(id)[1]
            if hasattr(url, '__call__'):
                url = url()
            return url
        except Exception, e:
            return '#'

    def get_tree(self):
        return [
            (u'Funktionen',
             [(label, 'internal://%s/%s' % (self.key, id)) for id, label, url in self.ACTIONS]),
        ]



class InquiryForm(forms.Form):
    SALUTATION_CHOICES = (
        ('', '--- Anrede ---'),
        ('Frau', 'Frau'),
        ('Herr', 'Herr'),
        ('Familie', 'Familie'),
    )
    salutation = forms.ChoiceField(label=_('Anrede'), choices=SALUTATION_CHOICES)
    email = forms.EmailField(label=_('E-Mail'), required=True)
    firstname = forms.CharField(label=_('Vorname'))
    lastname = forms.CharField(label=_('Nachname'))

    arrival = forms.DateField(label=_("Anreise"),
                              input_formats=['%d.%m.%Y',])
    departure = forms.DateField(label=_("Abreise"),
                                input_formats=['%d.%m.%Y',])
    adults = forms.IntegerField(label=_('Erwachsene'),)
    children = forms.IntegerField(label=_('Kinder'), required=False)

    def clean(self):
        cd = self.cleaned_data
        arr = cd['arrival']
        dep = cd['departure']
        if dep <= arr:
            self.add_error('departure', _(u'Das Abreisedatum muss nach dem Anreisedatum liegen.'))


def inquiry_form(request):
    form = InquiryForm()
    if request.method == "POST":
        form = InquiryForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            ctx = locals()
            body = render_to_string('mails/inquiry_mail.txt', ctx)
            html_body = render_to_string('mails/inquiry_mail.html', ctx)
            send_mail('Online-Anfrage: %s bis %s' % (data.get('arrival').strftime("%d.%m.%Y"),
                                                     data.get('departure').strftime("%d.%m.%Y")),
                      body,
                      "Website Anfrageformular <%s>" % settings.EMAIL_HOST_USER,
                      [settings.INQUIRY_RECIPIENT,],
                      html_message=html_body,
                      reply_to=data.get('email'),
                      fail_silently=False)
            return HttpResponseRedirect(reverse('inquiry_form_thanks'))

    return render(request, 'views/inquiry_form.html', locals())

def inquiry_form_thanks(request):
    return render(request, 'views/inquiry_form_thanks.html', locals())
