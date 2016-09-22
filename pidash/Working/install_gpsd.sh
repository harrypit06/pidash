#!/bin/bash
apt-get -y install gpsd gpsd-clients python-gps
systemctl stop gpsd.socket
systemctl disable gpsd.socket
systemctl stop serial-getty@ttyS0.service
systemctl disable serial-getty@ttyS0.service