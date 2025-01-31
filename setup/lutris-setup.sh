#!/bin/bash

# Check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "deb [signed-by=/etc/apt/keyrings/lutris.gpg] https://download.opensuse.org/repositories/home:/strycore/Debian_12/ ./" | tee /etc/apt/sources.list.d/lutris.list > /dev/null
wget -q -O- https://download.opensuse.org/repositories/home:/strycore/Debian_12/Release.key | gpg --dearmor | tee /etc/apt/keyrings/lutris.gpg > /dev/null
apt update
apt install lutris -y
