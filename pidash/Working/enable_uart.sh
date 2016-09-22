#!/bin/bash
sed -i "s/console=ttyAMA0,115200//" /boot/cmdline.txt
sed -i "s/kgdboc=ttyAMA0,115200//" /boot/cmdline.txt
echo "enable_uart=1" >> /boot/config.txt
echo "core_freq=250" >> /boot/config.txt
sudo systemctl stop serial-getty@ttyS0.service
sudo systemctl disable serial-getty@ttyS0.service
# enable uart sudo nano /boot/config.txt
#remove console=serial0,115200 or console=ttyS0,115200