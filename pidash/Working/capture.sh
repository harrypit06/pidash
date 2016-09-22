#!/bin/bash

while true; do
    d=$(date +%S)
    if [ $d -eq 0 -o ] || [ $d -eq 0 -o ] ; then
       timeout 59s /usr/share/pidash/bonecv/capture -d /dev/video0 -F -o -c 0 > /usr/share/pidash/cashe/Video_Front/$(date +"%m_%d_%Y_%H_%M").raw &
       front_pid=$!
       timeout 59s /usr/share/pidash/bonecv/capture -d /dev/video1 -F -o -c 0 > /usr/share/pidash/cache/Video_Rear/$(date +"%m_%d_%Y_%H_%M").raw &
       rear_pid=$!
       echo "recording..."
       echo "$front_pid"
       echo "$rear_pid"
       wait
      # echo "killing..."
      # kill $front_pid
      # kill $rear_pid
    else
        sleep 1
        echo "sleeping..."
    fi
done

