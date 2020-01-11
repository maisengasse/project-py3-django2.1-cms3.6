# Setup Server 

### root: Kunden-Account am Server erstellen
- Generate User `mkweb -- user Username --ssh`
- *Safe Output to 1Password!*
---

### Kunden-Account einrichten
- SSH Key kopieren `ssh-copy-id URL`
- Bash-Farben setzen `vi .bashrc`
- Projektverzeichnisse erstellen `mkdir projects` -> `cd projects` -> `mkdir julianschwazer`
- Static- und Media-Verzeichnisse erstellen `mkdir static && mkdir media`
- Deployment-Key generieren `ssh-keygen -t rsa`
- Deployment-Key kopieren `cat ~/.ssh/id_rsa.pub`
- Deployment-Key bei Github hinterlegen
- Git Projekt per SSH klonen
---

### Python Virtual ENV
- Virtual ENV erstellen `python3 -m venv python-julianschwazer`
- Requirements installieren `python-julianschwazer/bin/pip install -r projects/julianschwazer/julianschwazer/requirements.txt`
---

### Datenbank und Daten kopieren
- Lokalen MySQLDump erstellen `mysqldump julianschwazer > julianschwazer.deploy.sql`   
- Dump kopieren `scp julianschwazer.deploy.sql julianschwazer@mgh2.mynet.at:projects/julianschwazer`
- Media-Daten von Lokal auf Server kopieren `rsync -e ssh -avz media/filer_public julianschwazer@mgh2.mynet.at:projects/julianschwazer/media`
- MySQL config file kopieren `cp provider/.my.cnf ~/`
- MySQL Passwort einfügen `vi .my.cnf`
- Dump importieren `mysql julianschwazerdb1 < julianschwazer.deploy.sql` 
---

### Django-Setup abschliessen
- manage.py kopieren und ausführbar machen `cp provider/manage.py .`
   `chmod +x manage.py`
- production.py kopieren `cp provider/production.py julianschwazer/settings/`
- MySQL-Passwort in production.py einfügen `vi julianschwazer/settings/production.py`
- Setup checken `./manage.py check`
- Holt Static Dateien  `./manage.py collectstatic`
- Symlink für Projekt statics erstellen `ln -s ../julianschwazer/static/ julianschwazer`
---

### Apache Setup
- Im Homeverzeichnis `mkdir ~/wsgi && mkdir ~/logs`
- .wsgi kopieren `cp projects/julianschwazer/julianschwazer/provider/project.wsgi wsgi/julianschwazer.wsgi`
---

### Apache Setup Abschluss als Root
- Apache-Conf kopieren `cp /data/web/julianschwazer/home/projects/julianschwazer/julianschwazer/provider/project.conf /etc/apache2/sites-available/julianschwazer.conf
- Checked Apache `apachectl configtest`
- Startet Apache Server `apachectl graceful`
---
