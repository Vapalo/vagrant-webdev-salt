#!/bin/bash

echo "Installing salt-minion..."

apt-get update > /dev/null
apt-get install -y salt-minion > /dev/null


echo "Remember to set salt master address and minion id inside /etc/salt/minion"
echo "Done!"
