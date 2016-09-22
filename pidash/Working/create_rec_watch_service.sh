#!/bin/bash
echo 'description "Monitor and control recording LED"
author "mitchell.kennedylnx@gmail.com"

start on runlevel [2345]
stop on runlevel [!2345]

respawn

exec python /usr/share/pidash/rec_watch.py' >> /etc/init/rec_watch.conf