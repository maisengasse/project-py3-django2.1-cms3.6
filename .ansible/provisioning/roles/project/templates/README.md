Project
=======

Website based on Django 2.1 / Django CMS 3.6
Copyright (c) 2019 Büro Maisengasse OG

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

- goto project directory: `cd {{ project_name }}`
- run fabric sync command: `./fabric initdb`


Development:
---

- Project Directory: `~/{{ project_name }}`
- Management Command: `~/{{ project_name }}/manage.py`
- Runserver shortcut: `~/{{ project_name }}/runserver`
- Virtualenv: `~/python-{{ project_name }}`
- WSGI Directory: `~/wsgi`

### Forwarded Ports

- apache: 8080
- runserver: 8081
- mysql: 3307
