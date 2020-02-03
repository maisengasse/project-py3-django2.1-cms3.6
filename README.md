maisengasse
=======

Website based on Django 2.2.7 / Django CMS 3.7
Copyright &copy; 2019 Büro Maisengasse OG

Development Environment Requirements
---

- [Vagrant](https://www.vagrantup.com)
- Vagrant provider, eg [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Ansible](https://www.ansible.com)

Initial Setup:
---

### Setup vagrant and connect to host

- `vagrant up`
- `vagrant ssh`


### Get all data from production

- go to project directory: `cd maisengasse`
- run fabric sync command: `./fabric initdb`


Development:
---

- Project Directory: `~/maisengasse`
- Management Command: `~/maisengasse/manage.py`
- Runserver shortcut: `~/maisengasse/runserver`
- Virtualenv: `~/python-maisengasse`
- WSGI Directory: `~/wsgi`

### Forwarded Ports

- apache: 8080
- runserver: 8081
- mysql: 3307
