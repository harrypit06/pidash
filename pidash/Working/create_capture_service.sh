#!/bin/bash
echo 'description "Record 3 minute loop from both cameras"
author "mitchell.kennedylnx@gmail.com"

start on runlevel [2345]
stop on runlevel [!2345]

respawn

exec sh /usr/share/pidash/capture.sh' >> /etc/init/capture.conf