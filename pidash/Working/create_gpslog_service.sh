#!/bin/bash
echo 'description "Begins gps logging"
author "mitchell.kennedylnx@gmail.com"

start on runlevel [2345]
stop on runlevel [!2345]

respawn

script

    killall gpsd
    gpsd /dev/ttyS0 -F /var/run/gpsd.sock
    gpxlogger -d -f /media/sda1/GPS_Log/$(date +"%m_%d_%Y_%H_%M").gpx -m 50

end script' >> /etc/init/gpslog.conf