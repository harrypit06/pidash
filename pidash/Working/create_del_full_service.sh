#!/bin/bash
echo 'description "Monitor sda1 and delete oldest files when full"
author "mitchell.kennedylnx@gmail.com"

start on runlevel [2345]
stop on runlevel [!2345]

respawn

exec sh /usr/share/pidash/del_when_full.sh' >> /etc/init/delete.conf