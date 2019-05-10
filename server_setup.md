# Setup Server 

### Access Server with root and generate user
- ssh root@mgh2.mynet.at
- Generate User `mkweb -- user Username --ssh`
- *Safe Output to 1Password!*
---

### Access Server with newly created user
- SSH Key add `ssh-copy-id URL`
- set bash color on server: `vi .bashrc`
- generate project directory `mkdir projects` -> `cd projects` -> `mkdir Projektname`
- Static und Media generieren `mkdir static && mkdir media`
- Deployment-Key generieren `ssh-keygen -t rsa`
- Deployment-Key kopieren `cat ~/.ssh/id_rsa.pub`
- Deployment-Key bei Github hinterlegen
- Git Projekt per SSH klinen
- auf Home wechseln `cd ~`
---

### Python Virtual ENV
- Virtual ENV erstellen `python3 -m venv python-projektname`
- Requirements installieren `python-projektname/bin/pip install -r projects/projektname/projektname/requirements.txt`
---

### Datenbank und Daten kopieren
- Lokalen MySQLDump erstellen `mysqldump project > project.deploy.sql`   
- Dump kopieren `scp project.deploy.sql project@mgh2.mynet.at:projects/project`
- Media-Daten von Lokal auf Server kopieren `rsync -e ssh -avz media/filer_public project@mgh2.mynet.at:projects/project/media`
- MySQL config file kopieren: `cp provider/.my.cnf ~/`
- MySQL Passwort einfügen: `vi .my.cnf`
- Dump importieren `mysql maisengassedb1 < maisengasse.deploy.sql` 
---

### Django-Setup abschliessen
- manage.py kopieren und ausführbar machen `cp provider/manage.py .`
   `chmod +x manage.p`
- production.py kopieren: `cp provider/production.py maisengasse/settings/`
- MySQL-Passwort in production.py einfügen: `vi maisengasse/settings/production.py`
- Setup checken: `./manage.py check`
- Holt Static Dateien  `./manage.py collectstatic`
- Symlink für Projekt statics erstellen `ln -s ../maisengasse/static/ maisengasse`
---

### Apache Setup
- Im Homeverzeichnis `mkdir ~/wsgi && mkdir ~/logs`
- .wsgi kopieren: `cp projects/maisengasse/maisengasse/provider/project.wsgi wsgi/maisengasse.wsgi`
---

### Apache Setup Abschluss als Root
- Apache-Conf kopieren: `cp /data/web/maisengasse/home/projects/maisengasse/maisengasse/provider/project.conf /etc/apache2/sites-available/maisengasse.conf
- Checked Apache `apachectl configtest`
- Startet Apache Server `apachectl graceful`
---
