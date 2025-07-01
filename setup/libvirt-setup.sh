#!/bin/bash

#install through apt

# Require sudo
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run with sudo."
  exit 1
fi

apt install virt-manager \
    libvirt-daemon-system \
    libvirt-daemon-system-sysv \
    gir1.2-spiceclientglib-2.0 \
    gir1.2-spiceclientgtk-3.0 \
    qemu-utils \
    virt-viewer \
    qemu-system-x86


usermod -a -G libvirt "$SUDO_USER"
