# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :tchoupi do |tchoupi_config|
    tchoupi_config.vm.box = "raring64"
    tchoupi_config.vm.box_url = "http://bit.ly/vagrant-lxc-raring64-2013-09-28-"
    tchoupi_config.vm.hostname = "Tchoupi"
    tchoupi_config.vm.network :private_network, :ip => '10.10.10.10'

    tchoupi_config.ssh.forward_agent = true
    tchoupi_config.ssh.forward_x11 = true

    tchoupi_config.vm.provider :virtualbox do |vb|
      #vb.gui = true
      vb.customize ["modifyvm", :id, "--memory", "1024"]
      vb.name = "Tchoupi"
    end

    tchoupi_config.vm.provision :docker do |docker|
      #docker.version = '0.6.3' # default -> :latest
      docker.pull_images 'nlamirault/commonlisp'
    end

    tchoupi_config.vm.provision :ansible do |ansible|
      ansible.playbook = "ansible/tchoupi_dev.yml"
      ansible.inventory_file = "ansible/dev_hosts"
      ansible.options = '-vv'
    end

    tchoupi_config.vm.synced_folder "src/", "/home/vagrant/Apps/tchoupi"

  end

end
