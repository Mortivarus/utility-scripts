#!/bin/bash

# Check for root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt update && apt install extrepo -y

extrepo enable librewolf

apt update && apt install librewolf -y
