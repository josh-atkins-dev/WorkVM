# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "debian/contrib-jessie64"

  config.vm.synced_folder "./", "/vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end


  config.vm.define :dev do |dev|

    dev.vm.network "private_network", ip: "10.100.103.120"
    config.vm.network "forwarded_port", guest: 8080, host: 8080

    config.vm.provision :shell, path: "vagrant-bootstrap.sh"

  end


  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
