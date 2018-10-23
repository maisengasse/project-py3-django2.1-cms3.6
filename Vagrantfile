# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_CONFIG_VERSION = "2"
Vagrant.configure(VAGRANTFILE_CONFIG_VERSION) do |config|
	# Base box to build off, and download URL for when it doesn't exist on the user's system already
	config.vm.box = "ubuntu/trusty64"
    #config.vm.box_version = "20180614.0.2"
	#config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-i386-vagrant-disk1.box"

	# As an alternative to precise32, VMs can be built from the 'django-base' box as defined at
	# https://github.com/torchbox/vagrant-django-base , which has more of the necessary server config
	# baked in and thus takes less time to initialise. To go down this route, you will need to build
	# and host django-base.box yourself, and substitute your own URL below.
	#config.vm.box = "django-base-v2.2"
	#config.vm.box_url = "http://vmimages.torchbox.com/django-base-v2.2.box"  # Torchbox-internal URL to django-base.box

	# Boot with a GUI so you can see the screen. (Default is headless)
	# config.vm.boot_mode = :gui

	# Assign this VM to a host only network IP, allowing you to access it
	# via the IP.
	# config.vm.network "33.33.33.10"


	# Forward a port from the guest to the host, which allows for outside
	# computers to access the VM, whereas host only networking does not.
	config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
	config.vm.network :forwarded_port, guest: 8000, host: 8081, auto_correct: true
	config.vm.network :forwarded_port, guest: 3306, host: 3307, auto_correct: true

	# Share an additional folder to the guest VM. The first argument is
	# an identifier, the second is the path on the guest to mount the
	# folder, and the third is the path on the host to the actual folder.
	config.vm.synced_folder "../maisen.cmstools", "/home/vagrant/maisen.cmstools"

	# Enable provisioning with a shell script.
	# config.vm.provision :shell, :path => "etc/install/install.sh", :args => "intermedia"

	# RAM and CPUS
	config.vm.provider "virtualbox" do |v|
	  v.memory = 1024
	  v.cpus = 2
	end

	# User
	config.ssh.forward_agent = true

	# provisioning with ansible
	config.vm.provision "ansible" do |ansible|
	  ansible.playbook = ".ansible/provisioning/playbook.yml"
	  ansible.sudo = true
	  ansible.verbose = 'vv'
	  ansible.force_remote_user = "vagrant",
	  ansible.extra_vars = {
	  	provider: 'mynet',
	  	setup_provider: true,
	  	app_user: "vagrant",
	  	app_grp: "vagrant",
	  	home_dir: "/home/vagrant",
	  	project_name: "appproject",
	  	project_domain: "appproject.at",
	  	project_dir: "/home/vagrant/appproject",
	  	deployment: false,
	  	create_project: true,
	  	create_project_search: false,
	  	create_project_mailings: false,
	  	create_project_modules: false,
	  	db_name: 'appproject',
	  	db_user: 'appproject',
	  	db_password: '',
	  	db_root_password: '',
	  }
	end
end
