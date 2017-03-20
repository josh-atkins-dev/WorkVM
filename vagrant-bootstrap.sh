#!/bin/bash


apt-get install -y fortune git ntp software-properties-common
apt-get update

echo "Installing Ansible..."
apt-get install -y ansible 

ansible-galaxy install kbrebanov.openvpn
# ansible-galaxy install angstwad.docker_ubuntu


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
