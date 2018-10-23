from django.utils import simplejson as json
import os, poplib, re
from optparse import make_option
from django.core.management.base import BaseCommand, CommandError
from django.conf import settings
from maisen.nlcontacts.models import NLSubscription, unsubscribe_subscription
from maisen.nlcontacts.importer import csv_importer
from django.core.exceptions import ValidationError
from django.core.validators import validate_email

# BOX_HOST = 'mail.igpassivhaus-tirol.at'
# BOX_USER = 'newsletter@igpassivhaus-tirol.at'
# BOX_PASS = 'ig2011'

BOX_HOST = 'mail.zweiraum.cc'
BOX_USER = 'newsletter@zweiraum.cc'
BOX_PASS = '79z68ygt'

BOUNCED_SUBJECTS = [
    "Undelivered Mail Returned to Sender",
    "Mail delivery failed",
    "Undeliverable",
]

MAIL_RES = [
    'To:.*\<([^\s]+@[^\s]+)\>',
    'To: ([^\s]+@[^\s]+)',
]

def is_bounced_mail(headers):
    for header in headers:
        if header.lower().startswith('subject'):
            for bsub in BOUNCED_SUBJECTS:
                if header.lower().find(bsub.lower()) > -1:
                    return True
    return False


def get_bounced_address(mail):
    for line in mail[1]:
        if line.lower().startswith('to'):
            for regex in MAIL_RES:
                matches = re.compile(regex).findall(line)
                if matches:
                    match = matches[0]
                    match = match.startswith('<') and match[1:] or match
                    match = match.endswith('>') and match[:-1] or match
                    if match != BOX_USER:
                        return match


class Command(BaseCommand):
    help = 'Check bounced Newsletter Subscriptions'

    option_list = BaseCommand.option_list + (
        make_option('--delete',
            dest='delete',
            action="store_true",
            default=False,
            help='Delete subscriptions after check'),
    )

    def handle(self, *args, **kw):
        box = poplib.POP3(BOX_HOST)
        box.user(BOX_USER)
        box.pass_(BOX_PASS)
        bcount = 0
        count = len(box.list()[1])
        for i in range(count):
            headers = box.top(i+1, 1)[1]
            if is_bounced_mail(headers):
                bcount += 1
                mail = box.retr(i+1)
                email = get_bounced_address(mail)
                if email:
                    if kw['delete'] is True:
                        try:
                            sub = NLSubscription.objects.get(email=email)
                            unsubscribe_subscription(sub)
                            print "[DELETE] removed subscription: %s" % email
                        except NLSubscription.DoesNotExist:
                            print "[SKIP] subscription does not exist: %s" % email
                    else:
                        print "[FOUND] Bounced %s" % email

        box.quit()
        print "Found %s bounced subscriptions." % bcount
