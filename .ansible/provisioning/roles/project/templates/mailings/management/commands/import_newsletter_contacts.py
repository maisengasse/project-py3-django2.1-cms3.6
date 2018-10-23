# -*- coding: utf-8 -*-

import os, shutil, datetime, csv
from optparse import make_option
from django.core.management.base import BaseCommand, CommandError
from django.conf import settings
from django.core.exceptions import ValidationError
from django.core.validators import validate_email

from emencia.django.newsletter.models import Contact, MailingList

from warnings import filterwarnings, resetwarnings
import MySQLdb as Database

LOGLEVEL = 1

class Command(BaseCommand):
    help = 'Import Newsletter Contacts'

    # option_list = BaseCommand.option_list + (
    #     make_option('--update',
    #         dest='update',
    #         default=None,
    #         action="store_true",
    #         help='Update Lists'),
    #     make_option('--flavor',
    #         dest='flavor',
    #         default=None,
    #         help='Flavor of Source'),
    # )

    def add_arguments(self, parser):
        parser.add_argument('path')

    def handle(self, path, *args, **kw):

        def mapper(raw):
            props = raw.copy()
            props.update({
                'first_name' : raw['firstname'],
                'last_name' : raw['lastname'],
                'tester' : raw['tester'] == '1',
                'lists' : ['Alle', 'IG Offiziell']
            })
            return props

        identifier = None
        handle = open(path)
        data = csv.DictReader(handle,
                              delimiter=",",
                              quotechar='"')

        created, updated, ignored = (0, 0, 0)

        filterwarnings('error', category = Database.Warning)

        for rawline in data:
            props = mapper(rawline)
            if props is None:
                if LOGLEVEL <= 0:
                    print u"[INVALID] Invalid Data: %s" % rawline
            else:
                if not isinstance(props, (list, tuple)): #support list types
                    props = [props]

                for prop in props:
                    try:
                        c, u, i = self.import_contact(prop, identifier, LOGLEVEL)
                    except Database.Warning, e:
                        if LOGLEVEL <= 2:
                            print "[IGNORE] DB Warning: %s: %s" % (prop.get('import_id', prop['email']), e.message)
                        c, u, i = 0, 0, 1
                    created += c
                    updated += u
                    ignored += i

        resetwarnings()

        print "Done. Created %s, Updated %s, Ignored %s" % (created, updated, ignored)


    def import_contact(self, props, identifier=None, loglevel=0):
        if not identifier:
            contact, created = Contact.objects.get_or_create(email=props['email'])
        else:
            contact, created = identifier(props)

        if contact is None and created is None:
            return (0,0,1)

        if created:
            contact.subscriber = True
            contact.valid = True

        if created:
            if loglevel <= 1:
                print "[CREATE] Created Contact: %s" % contact.email
            result = (1, 0, 0)
        else:
            if loglevel <= 0:
                print "[UPDATE] Updated Contact: %s" % contact.email
            result = (0, 1, 0)

        for key, value in props.items():
            setattr(contact, key, value)

        contact.save()
        for l in props.get('lists', []):
            mlist, created = MailingList.objects.get_or_create(name=l)
            mlist.subscribers.add(contact)

        return result
