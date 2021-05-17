#!/bin/bash

echo "Installing salt master..."

apt-get update > /dev/null
apt-get install -y salt-master > /dev/null

echo "Done!"
