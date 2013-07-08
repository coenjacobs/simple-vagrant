# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::configure("2") do |config|
	config.vm.box = "precise32"
	config.vm.box_url = "http://files.vagrantup.com/precise32.box"
	config.vm.hostname = "simple-vagrant.localhost"
	config.ssh.forward_agent = true

	config.vm.network :private_network, ip: "192.168.99.56"

	config.vm.provision :puppet do |puppet|
		puppet.manifests_path = "private/puppet/manifests"
		puppet.manifest_file  = "base.pp"
		puppet.module_path = "private/puppet/modules"
	end
end