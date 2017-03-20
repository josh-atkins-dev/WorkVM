#!/bin/bash

echo "Installing Ansible..."

the_ppa=http://ppa.launchpad.net/ansible/ansible/ubuntu

if ! grep -q "^deb .*$the_ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list
fi
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

apt-get install -y fortune ansible git ntp software-properties-common 


ansible-galaxy install kbrebanov.openvpn


echo "Installing Docker..."
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
apt-key fingerprint | grep "4096R/F273FCD8 2017-02-22" || exit
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y docker-ce
groupadd docker
usermod -aG docker vagrant
systemctl enable docker

wget -O - https://bootstrap.pypa.io/get-pip.py | python
pip install boto virtualenv awscli

bashrc=$(cat /home/vagrant/.bashrc)
grep -q -F '. /vagrant/vagrant.bashrc' /home/vagrant/.bashrc || echo -en "$bashrc\n. /vagrant/vagrant.bashrc" >>/home/vagrant/.bashrc
