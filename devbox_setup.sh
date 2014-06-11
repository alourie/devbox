#!/bin/sh

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y ansible cmake vcsh

for role in Ansibles.vim Ansibles.build-essential Ansibles.git Ansibles.python devbox.oh-my-zsh; do sudo ansible-galaxy install $role; done

mkdir ~/Projects
cd ~/Projects

git clone git://github.com/alourie/devbox_ansible
cd devbox_ansible

echo 'localhost   ansible_connection=local' > inventory
ansible-playbook -K -i inventory mybook.yml

for conf in vim zsh; do vcsh clone git://github.com/alourie/vcsh-$conf.git; done
