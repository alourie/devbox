#!/bin/sh

sudo apt-get install -y ansible python-apt python-pycurl git

for role in Ansibles.apt Ansibles.vim Ansibles.build-essential Ansibles.python devbox.oh-my-zsh devbox.chrome; do sudo ansible-galaxy install $role; done

mkdir ~/Projects
cd ~/Projects

git clone git://github.com/alourie/devbox_ansible
cd devbox_ansible

ansible-playbook -K -i inventory mybook.yml -e ansible_os_family=Debian
