# -*- coding: utf-8 -*-
import datetime
from django.conf import settings
from django import forms
from maisen.cmstools.mail import send_mail
from django.template.loader import render_to_string
from django.template import RequestContext
from django.shortcuts import render, get_object_or_404
from django.urls import reverse
from django.http import HttpResponseRedirect, Http404
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth.decorators import login_required
from django.utils.translation import ugettext_lazy as _
from maisen.cmstools.internallinks import internalmodelinstancelinks_factory
from maisen.cmstools.internallinks import InternalLinkHandler


@login_required
def home(request):
    return render(request, "home.html", locals())


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
            if hasattr(url, "__call__"):
                url = url()
            return url
        except (Exception,) as e:
            return "#"

    def get_tree(self):
        return [
            (
                u"Funktionen",
                [
                    (label, "internal://%s/%s" % (self.key, id))
                    for id, label, url in self.ACTIONS
                ],
            )
        ]


class InquiryForm(forms.Form):
    YEAR = timezone.now().year
    ADULTS_COUNT_CHOICES = zip(range(1, 10), range(1, 10))
    CHILD_COUNT_CHOICES = zip(range(7), range(7))
    CHILD_AGE_YEARS = [("", _("Jahr"))] + list(
        zip(range(YEAR - 18, YEAR), range(YEAR - 18, YEAR + 1))
    )
    CHILD_AGE_MONTHS = [("", _("Monat"))] + list(zip(range(1, 13), range(1, 13)))
    CHILD_AGE_DAYS = [("", _("Tag"))] + list(zip(range(1, 32), range(1, 32)))

    SALUTATION_CHOICES = [
        ("", _("-- Bitte wählen --")),
        ("Frau", _("Frau")),
        ("Herr", _("Herr")),
        ("Familie", _("Familie")),
    ]

    lang = forms.CharField(label=_("Sprache"), required=False)
    salutation = forms.ChoiceField(label=_("Anrede"), choices=SALUTATION_CHOICES)
    email = forms.EmailField(label=_("E-Mail"), required=True)
    phone = forms.CharField(label=_("Telefonnummer"))
    firstname = forms.CharField(label=_("Vorname"))
    lastname = forms.CharField(label=_("Nachname"))

    roomtype = forms.ModelChoiceField(
        Room.objects.current(),
        label=_("Zimmer- oder Apartmenttyp auswählen"),
        required=False,
    )
    roomtype_two = forms.ModelChoiceField(
        Room.objects.current(),
        label=_("Zimmer- oder Apartmenttyp auswählen"),
        required=False,
    )
    roomtype_three = forms.ModelChoiceField(
        Room.objects.current(),
        label=_("Zimmer- oder Apartmenttyp auswählen"),
        required=False,
    )
    roomtype_four = forms.ModelChoiceField(
        Room.objects.current(),
        label=_("Zimmer- oder Apartmenttyp auswählen"),
        required=False,
    )

    arrival = forms.DateField(label=_("Anreise"), input_formats=["%d.%m.%Y"])
    departure = forms.DateField(label=_("Abreise"), input_formats=["%d.%m.%Y"])

    adults = forms.ChoiceField(label=_("Erwachsene"), choices=ADULTS_COUNT_CHOICES)
    children = forms.ChoiceField(label=_("Kinder"), choices=CHILD_COUNT_CHOICES)

    child1_year = forms.ChoiceField(
        label=_("Jahr"), choices=CHILD_AGE_YEARS, required=False
    )
    child1_month = forms.ChoiceField(
        label=_("Monat"), choices=CHILD_AGE_MONTHS, required=False
    )
    child1_day = forms.ChoiceField(
        label=_("Tag"), choices=CHILD_AGE_DAYS, required=False
    )
    child2_year = forms.ChoiceField(
        label=_("Jahr"), choices=CHILD_AGE_YEARS, required=False
    )
    child2_month = forms.ChoiceField(
        label=_("Monat"), choices=CHILD_AGE_MONTHS, required=False
    )
    child2_day = forms.ChoiceField(
        label=_("Tag"), choices=CHILD_AGE_DAYS, required=False
    )
    child3_year = forms.ChoiceField(
        label=_("Jahr"), choices=CHILD_AGE_YEARS, required=False
    )
    child3_month = forms.ChoiceField(
        label=_("Monat"), choices=CHILD_AGE_MONTHS, required=False
    )
    child3_day = forms.ChoiceField(
        label=_("Tag"), choices=CHILD_AGE_DAYS, required=False
    )
    child4_year = forms.ChoiceField(
        label=_("Jahr"), choices=CHILD_AGE_YEARS, required=False
    )
    child4_month = forms.ChoiceField(
        label=_("Monat"), choices=CHILD_AGE_MONTHS, required=False
    )
    child4_day = forms.ChoiceField(
        label=_("Tag"), choices=CHILD_AGE_DAYS, required=False
    )
    child5_year = forms.ChoiceField(
        label=_("Jahr"), choices=CHILD_AGE_YEARS, required=False
    )
    child5_month = forms.ChoiceField(
        label=_("Monat"), choices=CHILD_AGE_MONTHS, required=False
    )
    child5_day = forms.ChoiceField(
        label=_("Tag"), choices=CHILD_AGE_DAYS, required=False
    )
    child6_year = forms.ChoiceField(
        label=_("Jahr"), choices=CHILD_AGE_YEARS, required=False
    )
    child6_month = forms.ChoiceField(
        label=_("Monat"), choices=CHILD_AGE_MONTHS, required=False
    )
    child6_day = forms.ChoiceField(
        label=_("Tag"), choices=CHILD_AGE_DAYS, required=False
    )

    message = forms.CharField(label=_("Ihre Wünsche"), widget=forms.Textarea)
    agb = forms.BooleanField(
        label=_("Ich akzeptiere die AGB und die Datenschutzerklärung.")
    )

    def clean(self):
        data = self.cleaned_data
        cd = self.cleaned_data
        arr = cd["arrival"]
        dep = cd["departure"]
        data["child_ages"] = []
        for agefield in ("child1", "child2", "child3", "child4", "child5", "child6"):

            year, month, day = (
                "%s_year" % agefield,
                "%s_month" % agefield,
                "%s_day" % agefield,
            )
            if data.get(year):
                try:
                    date = datetime.date(
                        year=int(data.get(year)),
                        month=int(data.get(month)),
                        day=int(data.get(day)),
                    )
                    data["child_ages"].append(date)
                except ValueError:
                    if data.get(year) is None:
                        field = "_year"
                    elif data.get(month) is None:
                        field = "_month"
                    else:
                        field = "_day"
                    self.add_error(f"{agefield}{field}", _("Bitte Fehler korrigieren"))
        if dep <= arr:
            self.add_error(
                "departure", _("Das Abreisedatum muss nach dem Anreisedatum liegen.")
            )

def inquiry_form(request):
    form = InquiryForm()
    if request.method == "POST":
        form = InquiryForm(request.POST)
        if form.is_valid():
            data = form.cleaned_data
            ctx = locals()
            body = render_to_string("inquiry/inquiry_mail.txt", ctx)
            html_body = render_to_string("inquiry/inquiry_mail.html", ctx)
            send_mail(
                "Online-Anfrage: %s bis %s"
                % (
                    data.get("arrival").strftime("%d.%m.%Y"),
                    data.get("departure").strftime("%d.%m.%Y"),
                ),
                body,
                "Website Anfrageformular <%s>" % settings.EMAIL_HOST_USER,
                [settings.INQUIRY_RECIPIENT],
                html_message=html_body,
                reply_to=data.get("email"),
                fail_silently=False,
            )
            return HttpResponseRedirect(reverse("inquiry_form_thanks"))

    return render(request, "inquiry/inquiry.html", locals())


def inquiry_form_thanks(request):
    return render(request, "inquiry/inquiry_thanks.html", locals())
