#!/bin/bash

echo "Installing salt-minion..."

apt-get update > /dev/null
apt-get install -y salt-minion > /dev/null

echo "Please enter salt master address:"
read master
echo "Please enter your minion id:"
read minion
echo master: $master > /etc/salt/minion
echo id: $minion >> /etc/salt/minion


echo "Copy the Vagrantfile to a folder of your preference"
echo "Done!"
