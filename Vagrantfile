# -*- mode: ruby -*-
# vi: set ft=ruby :


set_guest_vars_script = <<CREDENTIALS


if ! $(grep -q ". /home/vagrant/.credentials" "/home/vagrant/.profile"); then
  echo "... prepend sourcing ~/.credentials from ~/.profile"
  echo -e ". /home/vagrant/.credentials\n$(cat /home/vagrant/.profile)">/home/vagrant/.profile
fi

echo "... add env vars to /home/vagrant/.credentials"

cat << EOF > /home/vagrant/.credentials

export GITHUB_TOKEN=#{ENV['GITHUB_TOKEN']}
export GITHUB_USER=#{ENV['GITHUB_USER']}
export GITHUB_NAME="#{ENV['GITHUB_NAME']}"
export GITHUB_EMAIL=#{ENV['GITHUB_EMAIL']}

export AWS_PREFIX=#{ENV['AWS_PREFIX']}

export AWS_ACCESS_KEY_ID=#{ENV['AWS_ACCESS_KEY_ID']}
export AWS_SECRET_ACCESS_KEY=#{ENV['AWS_SECRET_ACCESS_KEY']}
export AWS_DEFAULT_REGION=#{ENV['AWS_DEFAULT_REGION']}
export AZ1="eu-central-1a"
export AZ2="eu-central-1b"

export AWS_BUCKET_NAME=#{ENV['AWS_PREFIX']}-bucket

export VPC_CIDR='10.2.0.0/16'
export VPC_NAME='#{ENV['AWS_PREFIX']}-vpc'
export VPC_OCTET_1="10"
export VPC_OCTET_2="2"
export VPC_DOMAIN="bringhim.coffee"

export SUBNET_SPECS='[{"cidr":"10.2.0.0/24","az":"eu-central-1a","name":"public_subnet_1"},{"cidr":"10.2.1.0/24","az":"eu-central-1b","name":"public_subnet_2"},{"cidr":"10.2.2.0/24","az":"eu-central-1a","name":"private_subnet_1"},{"cidr":"10.2.3.0/24","az":"eu-central-1b","name":"private_subnet_2"},{"cidr":"10.2.4.0/24","az":"eu-central-1a","name":"private_subnet_3"},{"cidr":"10.2.5.0/24","az":"eu-central-1a","name":"private_subnet_4"},{"cidr":"10.2.6.0/24","az":"eu-central-1b","name":"private_subnet_5"}]'

export PRIVATE_DNS_NAME="private-zone.vpc"

export EC2_KEY_NAME=#{ENV['AWS_PREFIX']}-key

export RDS_MASTER_USERNAME=#{ENV['RDS_MASTER_USERNAME']}
export RDS_MASTER_PASSWORD=#{ENV['RDS_MASTER_PASSWORD']}

export VPN_SUBNET_CIDR="10.8.0.0/24"

export VM_TEMP_PATH='/vagrant/tmp'

export ANSIBLE_CONFIG="/vagrant/ansible.cfg"
export ANSIBLE_ROLES_PATH='/vagrant/tmp/roles'
export ANSIBLE_PRIVATE_KEY_FILE="/vagrant/tmp/ssh/#{ENV['AWS_PREFIX']}-key.pem"

EOF


CREDENTIALS


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


    dev.vm.provision "credentials", type: "shell" do |s|
        s.inline = set_guest_vars_script
    end
    
    dev.vm.provision "shell", path: "vagrant-bootstrap.sh"

    

  end


  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
