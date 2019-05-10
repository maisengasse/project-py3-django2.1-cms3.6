# Setup Server 

## Access Server with Root Account
---
ssh root@mgh2.mynet.at

- Generate User `mkweb -- user Username --ssh`
- SSH Key add `ssh-copy-id URL`
- set Color for Server: `vi .bashrc`
- Generate Project `mkdir projects` -> `cd projects` -> `mkdir Projektname`

- Static und Media generieren `mkdir static && mkdir media`
- SSH Key generieren `ssh-keygen -t rsa`

- Key kopieren `cat ~/.ssh/id_rsa.pub`
- Key bei Github hinterlegen
- Git Projekt klonen mit git clone
- auf Home wechseln `cd ~`
---

### Python Virtual ENV
- Virtual ENV erstellen `python3 -m venv python-projektname`

- Requirements installieren `python-projektname/bin/pip install -r projects/projektname/projektname/requirements.txt`
---

### Datenbank und Daten kopieren
- MySQLDump erstellen `mysqldump project > project.deploy.sql`   
- Dump kopieren `scp project.deploy.sql project@mgh2.mynet.at:projects/project`

- Daten von Lokal auf Server kopieren `rsync -e ssh -avz media/filer_public project@mgh2.mynet.at:projects/project/media`
---

### Manage.py
- Manage.py bearbeiten `vi provider/manage.py .` 
- Kopieren und ausführbar machen `cp provider/manage.py .`
   `chmod +x manage.p`
- Ausführen `./manage.py`

- `cp provider/production.py maisengasse/settings/`
-  `vi maisengasse/settings/production.py`
- Ausführen `./manage.py` 
- `vi maisengasse/settings/production.py` 
- Checked manage.py `./manage.py check`
- Kopiert MySQL Config File `cp provider/.my.cnf ~/`
- MySQL Passwort hinterlegen `vi .my.cnf`
- PW testen `mysql maisengassedb1`
- `cd projects/maisengasse/`
- Dump importieren `mysql maisengassedb1 < maisengasse.deploy.sql` 
- Manage,py checken `./manage.py check`
- Im Homeverzeichnis `mkdir wsgi && mkdir logs`
- Dateien kopieren `cp projects/maisengasse/maisengasse/provider/project.wsgi wsgi/maisengasse.wsgi`
- `ls projects/maisengasse/maisengasse/provider/`
- `cd wsgi/`
- `vi maisengasse.wsgi`
- Holt Static Dateien  `./manage.py collectstatic`
- Symlink erstellen `ln -s ../maisengasse/static/ maisengasse`
- `vi maisengasse/settings/production.py `
- WSGI Datei touchen `touch ~/wsgi/maisengasse.wsgi`
---

### Root
- `cp /data/web/maisengasse/home/projects/maisengasse/maisengasse/provider/project.conf /etc/apache2/sites-available/maisengasse.conf
 vi /etc/apache2/sites-available/maisengasse.conf`

- Checked Apache `apachectl configtest`

- Startet Apache Server `apachectl graceful`

---