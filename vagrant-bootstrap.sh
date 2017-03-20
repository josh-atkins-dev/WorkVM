#!/bin/bash


apt-get install -y fortune git software-properties-common
apt-get update

echo "Installing Ansible..."
apt-get install -y ansible

bashrc=$(cat /home/vagrant/.bashrc)
grep -q -F '. /vagrant/vagrant.bashrc' /home/vagrant/.bashrc || echo -en "$bashrc\n. /vagrant/vagrant.bashrc" >>/home/vagrant/.bashrc
