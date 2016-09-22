#!/bin/bash

echo "Updating system..."
sleep 2
apt-get -y update
echo "Upgrading system..."
sleep 2
apt-get -y upgrade