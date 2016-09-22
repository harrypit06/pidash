#!/bin/bash
echo 'description "Watch cache folder and move videos to flash storage"
author "mitchell.kennedylnx@gmail.com"

start on runlevel [2345]
stop on runlevel [!2345]

respawn

exec sh /usr/share/pidash/inotify_front.sh & sh /usr/share/pidash/inotify_rear.sh' >> /etc/init/move.conf