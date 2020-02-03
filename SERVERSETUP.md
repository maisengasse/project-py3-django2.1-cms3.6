# Setup Server 

### root: Kunden-Account am Server erstellen
- Generate User `mkweb -- user Username --ssh`
- *Safe Output to 1Password!*
---

### Kunden-Account einrichten
- SSH Key kopieren `ssh-copy-id URL`
- Bash-Farben setzen `vi .bashrc`
- Projektverzeichnisse erstellen `mkdir projects` -> `cd projects` -> `mkdir maisengasse`
- Static- und Media-Verzeichnisse erstellen `mkdir static && mkdir media`
- Deployment-Key generieren `ssh-keygen -t rsa`
- Deployment-Key kopieren `cat ~/.ssh/id_rsa.pub`
- Deployment-Key bei Github hinterlegen
- Git Projekt per SSH klonen
---

### Python Virtual ENV
- Virtual ENV erstellen `python3 -m venv python-maisengasse`
- Requirements installieren `python-maisengasse/bin/pip install -r projects/maisengasse/maisengasse/requirements.txt`
---

### Datenbank und Daten kopieren
- Lokalen MySQLDump erstellen `mysqldump maisengasse > maisengasse.deploy.sql`   
- Dump kopieren `scp maisengasse.deploy.sql maisengasse@mgh2.mynet.at:projects/maisengasse`
- Media-Daten von Lokal auf Server kopieren `rsync -e ssh -avz media/filer_public maisengasse@mgh2.mynet.at:projects/maisengasse/media`
- MySQL config file kopieren `cp provider/.my.cnf ~/`
- MySQL Passwort einfügen `vi .my.cnf`
- Dump importieren `mysql maisengassedb1 < maisengasse.deploy.sql` 
---

### Django-Setup abschliessen
- manage.py kopieren und ausführbar machen `cp provider/manage.py .`
   `chmod +x manage.py`
- production.py kopieren `cp provider/production.py maisengasse/settings/`
- MySQL-Passwort in production.py einfügen `vi maisengasse/settings/production.py`
- Setup checken `./manage.py check`
- Holt Static Dateien  `./manage.py collectstatic`
- Symlink für Projekt statics erstellen `ln -s ../maisengasse/static/ maisengasse`
---

### Apache Setup
- Im Homeverzeichnis `mkdir ~/wsgi && mkdir ~/logs`
- .wsgi kopieren `cp projects/maisengasse/maisengasse/provider/project.wsgi wsgi/maisengasse.wsgi`
---

### Apache Setup Abschluss als Root
- Apache-Conf kopieren `cp /data/web/maisengasse/home/projects/maisengasse/maisengasse/provider/project.conf /etc/apache2/sites-available/maisengasse.conf
- Checked Apache `apachectl configtest`
- Startet Apache Server `apachectl graceful`
---
