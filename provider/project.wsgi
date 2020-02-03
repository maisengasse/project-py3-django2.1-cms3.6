#!/web/maisengasse/home/python-maisengasse/bin/python
import os
import sys
import site
site.addsitedir('/web/maisengasse/home/python-maisengasse/lib/python3.6/site-packages')

paths = [
  '/web/maisengasse/home/projects/maisengasse/maisengasse',
]
for path in paths:
  if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'maisengasse.settings.production'

UPGRADING = False
project_di = "/data/web/maisengasse/home/projects/maisengasse/maisengasse"

def upgrade_in_progress(environ, start_response):
    upgrade_file = os.path.join(project_dir, 'templates', '503.html')
    if os.path.exists(upgrade_file):
        response_headers = [('Content-type','text/html')]
        response = open(upgrade_file).read()
    else:
        response_headers = [('Content-type','text/plain')]
        response = 'Application upgrade in progress...please check back soon.'

    if environ['REQUEST_METHOD'] == 'GET':
        status = '503 Service Unavailable'
    else:
        status = '405 Method Not Allowed'
    start_response(status, response_headers)
    return [response]

if UPGRADING:
    application = upgrade_in_progress
else:
    from django.core.wsgi import get_wsgi_application
    application = get_wsgi_application()
