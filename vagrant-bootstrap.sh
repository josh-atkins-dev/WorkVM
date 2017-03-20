#!/bin/bash

apt-get update
apt-get install -y \
  fortune \
  git 

bashrc=$(cat /home/vagrant/.bashrc)
grep -q -F '. /vagrant/vagrant.bashrc' /home/vagrant/.bashrc || echo -en ". /vagrant/vagrant.bashrc\n$bashrc" >/home/vagrant/.bashrc