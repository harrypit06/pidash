#!/bin/bash
# automounting usb flash drives
# umask is used to allow every user to write on the stick
# we use --sync in order to enable physical removing of mounted memory sticks -- this is OK for fat-based sticks
# I don't automount sda since in my system this is the internal hard drive
# depending on your hardware config, usb sticks might be other devices than sdb*
echo "ACTION==\"add\",KERNEL==\"sda1*\", RUN+=\"/usr/share/pidash/create_storage_script.sh --sync --umask 000 %k\"" >/etc/udev/rules.d/auto_storage.rules
udevadm control --reload-rules
#/usr/share/pidash/make_storage_script.sh