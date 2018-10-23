import os
from fabric.api import local, run, cd, env
from fabric.operations import get

REMOTE_HOST = '{{ project_name }}@server'
REMOTE_PATH = '/home/{{ project_name }}'
REMOTE_DB = '{{ project_name }}'
REMOTE_MEDIA = [
    REMOTE_PATH + "/media/filer_public/",
    # REMOTE_PATH + "/media/ckeditor/"
]
LOCAL_PATH = os.path.dirname(__file__)
LOCAL_DB = '{{ db_name }}'
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
SYNC_MEDIA_DOWN = "rsync -e ssh -azv %(host)s:%(remote)s %(local)s"
SYNC_MEDIA_UP = "rsync -e ssh -azv %(local)s %(host)s:%(remote)s"
INIT_MEDIA_DATA = "rsync -a %(local)s/.ansible/data/media/ %(local)s/media/"

env.hosts = [REMOTE_HOST,]

# def installsass():
#     with cd(LOCAL_PATH):
#         local('\curl -sSL https://get.rvm.io | bash')
#         local('source /home/vagrant/.rvm/scripts/rvm')
#         local('rvm install ruby-2.2.8')
#         local('rvm use ruby-2.2.8')
#         local('gem install sass')

def initdb():
    with cd(LOCAL_PATH):
        local(INIT_MEDIA_DATA % { 'local' : LOCAL_PATH })
        db_from_dump('.ansible/data/project.clean.sql')
        local('./manage.py migrate')
        local('./manage.py changepassword maisengasse')


def sync_down(dumpfile="{{ project_name }}.sync.sql"):
    get_remote_dump(dumpfile, gzip=True)
    db_from_dump(dumpfile, gzip=True)
    get_remote_media()

def get_remote_dump(dumpfile="{{ project_name }}.sync.sql", gzip=False):
    with cd(REMOTE_PATH):
        context = { 'db' : REMOTE_DB, 'dump' : dumpfile, 'v' : REMOTE_MYSQL_VERSION }
        if gzip:
            run(CREATE_GZIP_DUMP % context)
            get("%s/%s.gz" % (REMOTE_PATH, dumpfile),"%s/%s.gz" % (LOCAL_PATH, dumpfile),)
        else:
            run(CREATE_DUMP % context)
            get("%s/%s" % (REMOTE_PATH, dumpfile),"%s/%s" % (LOCAL_PATH, dumpfile),)

def get_remote_media():
    for index, media in enumerate(REMOTE_MEDIA):
        context = {
            'host' : REMOTE_HOST,
            'remote' : REMOTE_MEDIA[index],
            'local' : LOCAL_MEDIA[index],
        }
        local(SYNC_MEDIA_DOWN % context)

# def send_local_media():
#     for index, media in enumerate(REMOTE_MEDIA):
#         context = {
#             'host' : REMOTE_HOST,
#             'remote' : REMOTE_MEDIA[index],
#             'local' : LOCAL_MEDIA[index],
#         }
#         local(SYNC_MEDIA_UP % context)

def db_drop_all_tables():
    with cd(LOCAL_PATH):
        context = { 'db' : LOCAL_DB, 'v' : LOCAL_MYSQL_VERSION }
        local(DROP_ALL_TABLES % context)


def db_from_dump(dumpfile="{{ project_name }}.sync.sql", gzip=False):
    with cd(LOCAL_PATH):
        context = { 'db' : LOCAL_DB, 'dump' : dumpfile, 'v' : LOCAL_MYSQL_VERSION }
        local(DROP_ALL_TABLES % context)
        if gzip:
            local(LOAD_GZIP_DUMP % context)
        else:
            local(LOAD_DUMP % context)
