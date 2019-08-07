# Setup Server 

### root: Kunden-Account am Server erstellen
- Generate User `mkweb -- user Username --ssh`
- *Safe Output to 1Password!*
---

### Kunden-Account einrichten
- SSH Key kopieren `ssh-copy-id URL`
- Bash-Farben setzen `vi .bashrc`
- Projektverzeichnisse erstellen `mkdir projects` -> `cd projects` -> `mkdir {{ project_name }}`
- Static- und Media-Verzeichnisse erstellen `mkdir static && mkdir media`
- Deployment-Key generieren `ssh-keygen -t rsa`
- Deployment-Key kopieren `cat ~/.ssh/id_rsa.pub`
- Deployment-Key bei Github hinterlegen
- Git Projekt per SSH klonen
---

### Python Virtual ENV
- Virtual ENV erstellen `python3 -m venv python-{{ project_name }}`
- Requirements installieren `python-{{ project_name }}/bin/pip install -r projects/{{ project_name }}/{{ project_name }}/requirements.txt`
---

### Datenbank und Daten kopieren
- Lokalen MySQLDump erstellen `mysqldump {{ project_name }} > {{ project_name }}.deploy.sql`   
- Dump kopieren `scp {{ project_name }}.deploy.sql {{ project_name }}@mgh2.mynet.at:projects/{{ project_name }}`
- Media-Daten von Lokal auf Server kopieren `rsync -e ssh -avz media/filer_public {{ project_name }}@mgh2.mynet.at:projects/{{ project_name }}/media`
- MySQL config file kopieren `cp provider/.my.cnf ~/`
- MySQL Passwort einfügen `vi .my.cnf`
- Dump importieren `mysql {{ project_name }}db1 < {{ project_name }}.deploy.sql` 
---

### Django-Setup abschliessen
- manage.py kopieren und ausführbar machen `cp provider/manage.py .`
   `chmod +x manage.py`
- production.py kopieren `cp provider/production.py {{ project_name }}/settings/`
- MySQL-Passwort in production.py einfügen `vi {{ project_name }}/settings/production.py`
- Setup checken `./manage.py check`
- Holt Static Dateien  `./manage.py collectstatic`
- Symlink für Projekt statics erstellen `ln -s ../{{ project_name }}/static/ {{ project_name }}`
---

### Apache Setup
- Im Homeverzeichnis `mkdir ~/wsgi && mkdir ~/logs`
- .wsgi kopieren `cp projects/{{ project_name }}/{{ project_name }}/provider/project.wsgi wsgi/{{ project_name }}.wsgi`
---

### Apache Setup Abschluss als Root
- Apache-Conf kopieren `cp /data/web/{{ project_name }}/home/projects/{{ project_name }}/{{ project_name }}/provider/project.conf /etc/apache2/sites-available/{{ project_name }}.conf
- Checked Apache `apachectl configtest`
- Startet Apache Server `apachectl graceful`
---
