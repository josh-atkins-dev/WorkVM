# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "debian/contrib-jessie64"

  config.vm.synced_folder "./", "/vagrant"
  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end


  config.vm.define :dev do |dev|

    dev.vm.network "private_network", ip: "10.100.103.120"
    dev.vm.network "forwarded_port", guest: 8080, host: 8080

    dev.vm.provision "shell", path: "vagrant-bootstrap.sh"

    dev.vm.provision "credentials", type: "shell" do |s|
      s.path = "vagrant-credentials.sh"
      s.env = {
        "vagrant_credential_vars" => "AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY ANSIBLE_CONFIG AWS_DEFAULT_REGION AWS_PREFIX VM_TEMP_PATH ANSIBLE_ROLES_PATH VPC_CIDR VPC_OCTET_1 VPC_OCTET_2 PRIVATE_DNS_NAME AZ1 AZ2 VPN_SUBNET_CIDR EC2_KEY_NAME GITHUB_TOKEN GITHUB_USER ANSIBLE_PRIVATE_KEY_FILE VPC_DOMAIN", 
        "AWS_ACCESS_KEY_ID" => ENV['AWS_ACCESS_KEY_ID'],
        "AWS_SECRET_ACCESS_KEY" => ENV['AWS_SECRET_ACCESS_KEY'],
        "ANSIBLE_CONFIG" => "/vagrant/ansible.cfg",
        "AWS_DEFAULT_REGION" => ENV['AWS_DEFAULT_REGION'],
        "AWS_PREFIX" => ENV['AWS_PREFIX'],
        "VM_TEMP_PATH" => '/vagrant/tmp',
        "ANSIBLE_ROLES_PATH" => '$VM_TEMP_PATH/roles',
        "VPC_CIDR" => '10.2.0.0/16',
        "VPC_OCTET_1" => "10",
        "VPC_OCTET_2" => "2",
        "PRIVATE_DNS_NAME" => "private-zone.vpc",
        "AZ1" => "eu-central-1a",
        "AZ2" => "eu-central-1b",
        "VPN_SUBNET_CIDR" => "10.8.0.0/24",
        "EC2_KEY_NAME" => ENV['AWS_PREFIX'] + "-key",
        "GITHUB_TOKEN" => ENV['GITHUB_TOKEN'],
        "GITHUB_USER" => ENV['GITHUB_USER'],
        "ANSIBLE_PRIVATE_KEY_FILE" => "$VM_TEMP_PATH/ssh/$EC2_KEY_NAME.pem",
        "VPC_DOMAIN" => "bringhim.coffee"
      }
    end

    

  end


  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
