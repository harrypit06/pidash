#!/bin/bash
mkdir /usr/share/pidash
mkdir /usr/share/pidash/bonecv
mkdir /usr/share/pidash/cache
mkdir /usr/share/pidash/cache/Video_Front
mkdir /usr/share/pidash/cache/Video_Rear
mkdir /home/pi/delete_cache
chmod +x gpsd_socket.sh
chmod +x gps_log.sh
chmod +x create_storage_script.sh
chmod +x LED_REC_ON.py
chmod +x LED_REC_OFF.py
chmod +x rec_watch.py
chmod +x capture.sh
chmod +x convert.sh
chmod +x del_when_full.sh
cp create_storage_script.sh /usr/share/pidash
cp gpsd_socket.sh /usr/share/pidash
cp LED_REC_ON.py /usr/share/pidash
cp LED_REC_OFF.py /usr/share/pidash
cp rec_watch.py /usr/share/pidash
cp capture.sh /usr/share/pidash
cp del_when_full.sh /usr/share/pidash
cp convert.sh /usr/share/pidash
cp vidmove.sh /usr/share/pidash
cp inotify_front.sh /usr/share/pidash
cp inotify_rear.sh /usr/share/pidash
cp gps_log.sh /usr/share/pidash