import os
from invoke import Exit
from fabric import task
from fabric import Connection
REMOTE_HOST = 'mgh2.mynet.at'
REMOTE_USER = '{{ project_name }}'
REMOTE_PATH = '/web/{{ project_name }}/home/projects/{{ project_name }}'
REMOTE_DB = '{{ project_name }}db2'
REMOTE_MEDIA = [
    REMOTE_PATH + "/media/filer_public/",
    # REMOTE_PATH + "/media/ckeditor/"
]
LOCAL_PATH = '/home/vagrant/{{ project_name }}'
LOCAL_DB = '{{ project_name }}'
LOCAL_MEDIA = [
    LOCAL_PATH + '/media/filer_public/',
    # LOCAL_PATH + '/src/{{ project_name }}/media/ckeditor/'
]

LOCAL_MYSQL_VERSION = ""
REMOTE_MYSQL_VERSION = ""
DROP_ALL_TABLES = "mysqldump%(v)s --add-drop-table --no-data %(db)s | grep -e '^DROP \| FOREIGN_KEY_CHECKS' | mysql%(v)s %(db)s"
CREATE_DUMP = "mysqldump%(v)s %(db)s > %(dump)s"
CREATE_GZIP_DUMP = "mysqldump%(v)s %(db)s | gzip > %(dump)s.gz"
LOAD_DUMP = "mysql%(v)s %(db)s < %(dump)s"
LOAD_GZIP_DUMP = "gunzip -c %(dump)s.gz | mysql%(v)s %(db)s"
SYNC_MEDIA_DOWN = "rsync -e ssh -azv %(user)s@%(host)s:%(remote)s %(local)s"
SYNC_MEDIA_UP = "rsync -e ssh -azv %(local)s %(user)s@%(host)s:%(remote)s"
INIT_MEDIA_DATA = "rsync -a %(local)s/.ansible/data/filer_public/ %(local)s/media/filer_public/"

local = Connection("localhost", user='vagrant', connect_kwargs=dict(password="vagrant",allow_agent=False,look_for_keys=False))
remote = Connection(REMOTE_HOST, user=REMOTE_USER, connect_kwargs=dict(allow_agent=False,look_for_keys=False))

@task
def initdb(c):
    with local.cd(LOCAL_PATH):
        local.run(INIT_MEDIA_DATA % { 'local' : LOCAL_PATH })
        db_from_dump(c, dumpfile='.ansible/data/project.clean.sql')
        local.run('./manage.py migrate')
        local.run('./manage.py changepassword maisengasse')

@task
def db_from_dump(c, dumpfile="{{ project_name }}.sync.sql", gzip=False):
    with local.cd(LOCAL_PATH):
        context = { 'db' : LOCAL_DB, 'dump' : dumpfile, 'v' : LOCAL_MYSQL_VERSION }
        local.run(DROP_ALL_TABLES % context)
        if gzip:
            local.run(LOAD_GZIP_DUMP % context)
        else:
            local.run(LOAD_DUMP % context)

@task
def get_remote_dump(c, dumpfile="{{ project_name }}.sync.sql", gzip=False):
    with remote.cd(REMOTE_PATH):
        context = { 'db' : REMOTE_DB, 'dump' : dumpfile, 'v' : REMOTE_MYSQL_VERSION }
        if gzip:
            remote.run(CREATE_GZIP_DUMP % context)
            remote.get("%s/%s.gz" % (REMOTE_PATH, dumpfile),"%s/%s.gz" % (LOCAL_PATH, dumpfile),)
        else:
            remote.run(CREATE_DUMP % context)
            remote.get("%s/%s" % (REMOTE_PATH, dumpfile),"%s/%s" % (LOCAL_PATH, dumpfile),)

@task
def sync_down(c, dumpfile="{{ project_name }}.sync.sql"):
    get_remote_dump(c, dumpfile, gzip=True)
    db_from_dump(c, dumpfile, gzip=True)
    get_remote_media(c)

@task
def get_remote_media(c):
    for index, media in enumerate(REMOTE_MEDIA):
        context = {
            'user' : REMOTE_USER,
            'host' : REMOTE_HOST,
            'remote' : REMOTE_MEDIA[index],
            'local' : LOCAL_MEDIA[index],
        }
        c.run(SYNC_MEDIA_DOWN % context)
