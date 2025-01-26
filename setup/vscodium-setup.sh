#!/bin/bash

# Check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#Add the GPG key of the repository:

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

# Add the repository:

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | tee /etc/apt/sources.list.d/vscodium.list

# Update then install vscodium (if you want vscodium-insiders, then replace codium by codium-insiders):

apt update && apt install codium

