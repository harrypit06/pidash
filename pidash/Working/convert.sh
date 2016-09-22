#!/bin/bash
read -r -p "Warning: this is an irreversible conversion process. In an instance in which an error occurs, your video files may be GONE. Do not execute this script unless you have already backed up your video files elsewhere. This script also requires super user permission Would you like to continue? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 
       #cd into front cam directory
       echo "cding into front camera..."
       cd /media/sda1/Video_Front
       #Execute conversion
       echo "converting..."
       for f in *.raw; do ffmpeg -f h264 -i "$f" -vcodec copy "${f%.raw}.mp4"; done
       echo "cleaing up .raw files"
       #remove raw
       rm *.raw
       #cd into rear cam directory
       echo "cding into rear camera"
       cd /media/sda1/Video_Rear
       #execute conversion
       echo "converting"
       for f in *.raw; do ffmpeg -f h264 -i "$f" -vcodec copy "${f%.raw}.mp4"; done
       echo "cleaning up .raw files"
       rm *.raw
       echo "Conversion complete."
        ;;
    *)
        exit
        ;;
esac