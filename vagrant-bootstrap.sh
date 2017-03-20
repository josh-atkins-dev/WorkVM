#!/bin/bash

apt-get update
apt-get install fortune

bashrc=$(cat /vagrant/home/.bashrc)
grep -q -F '. /vagrant/vagrant.bashrc' /vagrant/home/.bashrc || echo -en ". /vagrant/vagrant.bashrc\n$bashrc" >/vagrant/home/.bashrc