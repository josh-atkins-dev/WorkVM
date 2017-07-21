#!/usr/bin/env bash

export

echo "Prepare for installing Ansible..."

the_ppa=http://ppa.launchpad.net/ansible/ansible/ubuntu

if ! grep -q "^deb .*$the_ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "deb ${the_ppa} trusty main" >> /etc/apt/sources.list
fi

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367



echo "Update apt-get..."
apt-get update


echo "Prepare for installing Docker..."
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
apt-key fingerprint | grep "4096R/F273FCD8 2017-02-22" || exit
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"


echo "Update apt-get..."
apt-get update


echo "Install packages..."
apt-get install -y fortune git ntp software-properties-common ansible docker-ce


echo "Configure docker..."
groupadd docker
usermod -aG docker vagrant
systemctl enable docker


echo "Install pip..."
wget -O - https://bootstrap.pypa.io/get-pip.py | python

echo "Install pip packages..."
pip install boto boto3 virtualenv awscli docker-compose awscurl


echo "Configure ~/.bashrc..."
bashrc=$(cat /home/vagrant/.bashrc)
grep -q -F '. /vagrant/vagrant_conf/vagrant.bashrc' /home/vagrant/.bashrc || echo -en "$bashrc\n. /vagrant/vagrant_conf/vagrant.bashrc" >>/home/vagrant/.bashrc



echo "Create projects dir..."
mkdir -p /vagrant/projects

echo "Create ~/bin..."
mkdir -p /home/vagrant/bin
chown vagrant:vagrant /home/vagrant/bin