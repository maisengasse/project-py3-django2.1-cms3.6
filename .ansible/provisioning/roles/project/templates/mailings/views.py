# -*- coding: utf-8 -*-
import re
from django.shortcuts import render_to_response, get_object_or_404
from django.utils.translation import ugettext_lazy as _
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.conf import settings
from django.core.mail import send_mail
from django.template.loader import render_to_string

from django.template.defaultfilters import linebreaksbr
from django.template import RequestContext
from django.core.urlresolvers import reverse
from django.utils.encoding import smart_str


from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


from emencia.django.newsletter.views.newsletter import render_newsletter
from emencia.django.newsletter.models import Newsletter, Contact, MailingList, SMTPServer

from forms import NewsletterSubscriptionForm, NewsletterUnsubscriptionForm

def linktree_js(request):
    tree = get_absolute_mainsite_tree()
    return render_to_response('linktree.js',
                             { 'urls' : tree },
                             RequestContext(request))

def show_mailing(request, slug):
    contact = None
    if request.GET.get('contact'):
        contact = Contact.objects.get_by_hashid(request.GET.get('contact'))

    context = {'preview' : True,
               'contact' : contact,
               'NEWSLETTER_MEDIA_URL' : settings.NEWSLETTER_MEDIA_URL,
               'NEWSLETTER_PORTAL_URL' : settings.NEWSLETTER_PORTAL_URL,
               'MEDIA_URL' : settings.MEDIA_URL, }
    return render_newsletter(request, slug, context)


def _send_confirmation_mail(contact):#, list=None, add_to_alllist=True):

    ctx = {
        'contact' : contact,
        'NEWSLETTER_PORTAL_URL' : settings.NEWSLETTER_PORTAL_URL,
        'NEWSLETTER_MEDIA_URL' : settings.NEWSLETTER_MEDIA_URL,
    }

    body = render_to_string('mailings/mails/confirmation_mail.txt', ctx)
    body_html = render_to_string('mailings/mails/confirmation_mail.html', ctx)

    server = SMTPServer.objects.get()
    smtp = server.connect()

    message = MIMEMultipart()
    message['Subject'] = 'Ihre Newsletteranmeldung'
    message['From'] = settings.NEWSLETTER_DEFAULT_HEADER_SENDER
    message['Reply-to'] = settings.NEWSLETTER_DEFAULT_HEADER_REPLY
    message['To'] = contact.email

    message_alt = MIMEMultipart('alternative')
    message_alt.attach(MIMEText(smart_str(body), 'plain', 'UTF-8'))
    message_alt.attach(MIMEText(smart_str(body_html), 'html', 'UTF-8'))
    message.attach(message_alt)
    smtp.sendmail(settings.NEWSLETTER_DEFAULT_HEADER_SENDER,
                  contact.email,
                  message.as_string())

    smtp.quit()


def subscription_form(request):
    form = NewsletterSubscriptionForm()
    if request.method == 'POST':
        form = NewsletterSubscriptionForm(request.POST)
        if form.is_valid():
          cd = form.cleaned_data
          contact, created = Contact.objects.get_or_create(email=cd['email'])
          if created:
              contact.subscriber = False

          contact.first_name = cd['first_name']
          contact.last_name = cd['last_name']
          contact.save()

          for ml in ['Alle', 'IG Offiziell', 'Websiteanmeldung']:
              mlist, created = MailingList.objects.get_or_create(name=ml)
              mlist.subscribers.add(contact)

          _send_confirmation_mail(contact)

          return HttpResponseRedirect(reverse('newsletter:subscription_thanks'))

    page_title = _("Newsletteranmeldung")

    return render_to_response('mailings/subscription_form.html',
                              locals(),
                              context_instance=RequestContext(request))

def subscription_thanks(request):
    return render_to_response('mailings/subscription_thanks.html',
                              {},
                              context_instance=RequestContext(request))


def confirm_subscription(request):
    if request.GET.get('contact'):
        contact = Contact.objects.get_by_hashid(request.GET.get('contact'))
        contact.subscriber = True
        contact.save()
        return HttpResponseRedirect(reverse('newsletter:confirm_subscription_thanks'))
    else:
        raise Http404

def confirm_subscription_thanks(request):
    return render_to_response('mailings/confirm_subscription_thanks.html',
                              {},
                              context_instance=RequestContext(request))


def unsubscription_form(request, template='mailings/unsubscription_form.html'):
    form = NewsletterUnsubscriptionForm(initial=request.GET)
    if request.method == 'POST':
        form = NewsletterUnsubscriptionForm(request.POST)
        if form.is_valid():
            try:
                contact = Contact.objects.get(email=form.cleaned_data['email'])
                contact.subscriber = False
                for mlist in MailingList.objects.all():
                    mlist.subscribers.remove(contact)
                contact.save()
            except Contact.DoesNotExist:
                pass
            return HttpResponseRedirect(reverse('newsletter:unsubscription_thanks'))

    page_title = _("Newsletterabmeldung")

    return render_to_response(template,
                              locals(),
                              context_instance=RequestContext(request))

def unsubscription_thanks(request):
    return render_to_response('mailings/unsubscription_thanks.html',
                              {},
                              context_instance=RequestContext(request))
