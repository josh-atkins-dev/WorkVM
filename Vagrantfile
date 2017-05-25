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

    dev.vm.provision "credentials", 
      type: "shell",
      path: "vagrant_conf/set_credentials.sh",
      env: {
        "GITHUB_TOKEN" => "#{ENV['GITHUB_TOKEN']}",
        "GITHUB_USER" => "#{ENV['GITHUB_USER']}",
        "GITHUB_NAME" => "#{ENV['GITHUB_NAME']}",
        "GITHUB_EMAIL" => "#{ENV['GITHUB_EMAIL']}",

        "AWS_PROJECT_NAME" => "#{ENV['AWS_PROJECT_NAME']}",

        "AWS_ACCESS_KEY_ID" => "#{ENV['AWS_ACCESS_KEY_ID']}",
        "AWS_SECRET_ACCESS_KEY" => "#{ENV['AWS_SECRET_ACCESS_KEY']}",

        "AWS_DEFAULT_REGION" => "#{ENV['AWS_DEFAULT_REGION']}",
        "AZ1" => "#{ENV['AZ1']}",
        "AZ2" => "#{ENV['AZ2']}",
        "AZ3" => "#{ENV['AZ3']}",

        "VPC_CIDR" => "#{ENV['VPC_CIDR']}",
        "VPC_PRIVATE_DOMAIN" => "#{ENV['VPC_PRIVATE_DOMAIN']}",
        "VPC_PUBLIC_DOMAIN" => "#{ENV['VPC_PUBLIC_DOMAIN']}",

        "EC2_KEY_NAME" => "#{ENV['EC2_KEY_NAME']}",

        "RDS_MASTER_USERNAME" => "#{ENV['RDS_MASTER_USERNAME']}",
        "RDS_MASTER_PASSWORD" => "#{ENV['RDS_MASTER_PASSWORD']}",
        
        "PG_DB_NAME" => "#{ENV['PG_DB_NAME']}",
        "PG_USER" => "#{ENV['PG_USER']}",
        "PG_PASS" => "#{ENV['PG_PASS']}"
      }
    
    # dev.vm.provision "shell", path: "vagrant-bootstrap.sh"

    

  end


  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
