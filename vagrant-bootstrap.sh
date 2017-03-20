#!/bin/bash

bashrc=$(cat ~/.bashrc)
grep -q -F '. /vagrant/vagrant.bashrc' ~/.bashrc || echo -en ". /vagrant/vagrant.bashrc\n$bashrc" >.bashrc