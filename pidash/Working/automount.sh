#!/bin/bash
# automounting usb flash drives
# umask is used to allow every user to write on the stick
# we use --sync in order to enable physical removing of mounted memory sticks -- this is OK for fat-based sticks
# I don't automount sda since in my system this is the internal hard drive
# depending on your hardware config, usb sticks might be other devices than sdb*
echo "ACTION==\"add\",KERNEL==\"sda1*\", RUN+=\"/usr/bin/pmount --sync --umask 000 %k\"
ACTION==\"remove\", KERNEL==\"sda1*\", RUN+=\"/usr/bin/pumount %k\"
ACTION==\"add\",KERNEL==\"sda1*\", RUN+=\"/usr/bin/pmount --sync --umask 000 %k\"
ACTION==\"remove\", KERNEL==\"sda1*\", RUN+=\"/usr/bin/pumount %k\"" >/etc/udev/rules.d/automount.rules
udevadm control --reload-rules