!#/bin/bash
echo 'i2c-bcm2708
i2c-dev' >> /etc/modules

#comment out blacklist i2c-bcm2708
#>> /etc/modprobe.d/raspi-blacklist.conf

apt-get install -y python-smbus i2c-tools git-core

git clone https://github.com/pimoroni/adxl345-python /usr/share/pidash/adxl345