# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :tchoupi do |tchoupi_config|
    tchoupi_config.vm.box = "raring64"
    tchoupi_config.vm.box_url = "http://bit.ly/vagrant-lxc-raring64-2013-09-28-"
    tchoupi_config.vm.hostname = "Tchoupi"

    tchoupi_config.vm.network :private_network, :ip => '10.10.10.10'
    # Assign this VM to a host-only network IP, allowing you to access it
    # via the IP. Host-only networks can talk to the host machine as well as
    # any other machines on the same network, but cannot be accessed (through this
    # network interface) by any external networks.
    # tchoupi_config.vm.network :hostonly, "172.16.0.201"
    # tchoupi_config.vm.network :hostonly, "10.10.0.201"

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


  end

end
