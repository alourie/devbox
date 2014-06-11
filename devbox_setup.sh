#!/bin/sh

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y ansible cmake

for role in Ansibles.vim Ansibles.build-essential Ansibles.git Ansibles.python; do sudo ansible-galaxy install $role; done

echo 'localhost   ansible_connection=local' > inventory

ansible-playbook -K -i inventory playbook.yml
