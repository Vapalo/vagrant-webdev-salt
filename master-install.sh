#!/bin/bash

echo "Installing salt master, creating /srv/salt and copying states to it"

apt-get update > /dev/null
apt-get install -y salt-master > /dev/null
mkdir -p /srv/salt
cp -nr vbox/ vagpy/ react/ /srv/salt

echo "Done!"
