# -*- mode: ruby -*-
# vi: set ft=ruby :


set_guest_vars_script = <<CREDENTIALS


if ! $(grep -q ". /home/vagrant/.credentials" "/home/vagrant/.profile"); then
  echo "... source ~/.credentials from ~/.profile"
  echo ". /home/vagrant/.credentials" >> "/home/vagrant/.profile"
fi

echo "... add env vars to /home/vagrant/.credentials"

cat << EOF > /home/vagrant/.credentials

export AWS_ACCESS_KEY_ID=#{ENV['AWS_ACCESS_KEY_ID']}
export AWS_SECRET_ACCESS_KEY=#{ENV['AWS_SECRET_ACCESS_KEY']}
export ANSIBLE_CONFIG="/vagrant/ansible.cfg"
export AWS_DEFAULT_REGION=#{ENV['AWS_DEFAULT_REGION']}
export AWS_PREFIX=#{ENV['AWS_PREFIX']}
export VM_TEMP_PATH='/vagrant/tmp'
export ANSIBLE_ROLES_PATH='$VM_TEMP_PATH/roles'
export VPC_CIDR='10.2.0.0/16'
export VPC_OCTET_1="10"
export VPC_OCTET_2="2"
export PRIVATE_DNS_NAME="private-zone.vpc"
export AZ1="eu-central-1a"
export AZ2="eu-central-1b"
export VPN_SUBNET_CIDR="10.8.0.0/24"
export EC2_KEY_NAME=${AWS_PREFIX}-key
export S3_BUCKET=${AWS_PREFIX}-data
export GITHUB_TOKEN=#{ENV['GITHUB_TOKEN']}
export GITHUB_USER=#{ENV['GITHUB_USER']}
export ANSIBLE_PRIVATE_KEY_FILE="$VM_TEMP_PATH/ssh/$EC2_KEY_NAME.pem"
export VPC_DOMAIN="bringhim.coffee"

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

    dev.vm.provision "shell", path: "vagrant-bootstrap.sh"

    dev.vm.provision "credentials", type: "shell" do |s|
        s.inline = set_guest_vars_script
    end

    

  end


  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
