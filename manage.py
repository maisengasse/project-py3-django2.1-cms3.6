#!/home/vagrant/python-maisengasse/bin/python3.6
import os
import sys

if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "maisengasse.settings.development")
    os.environ['PYTHONIOENCODING'] = 'utf8'
    from django.core.management import execute_from_command_line
    execute_from_command_line(sys.argv)
