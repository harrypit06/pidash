#!/bin/bash
/usr/share/pidash/bonecv/capture -d /dev/video0 -F -o -c 300 > /media/sda1/Video_Front/video0.h264
./capture -d /dev/video1 -F -o -c 300 > /media/sda1/Video_Rear/video1.raw
ffmpeg -f h264 -i video0.raw -vcodec copy video0.mp4

ffmpeg -f -vcodec libx264 -i video0.mp4 \ -vf drawtext="fontsize=15:fontfile=/usr/share/fonts/truetype/dejavuDejaVuSans.tff: \ timecode='00\:00\:00\:00':rate=$frame_rate:text='$clipname' TCR:':\ fontsize=72:fontcolor='white':boxcolor=0x000000AA:\ box=1:x=860-text_w/2:y=960" video.mp4


#timestamp
for i in *.mov
frame_rate=$(ffprobe -i -show_streams 2>&1|grep fps|sed "s/.*, \([0-9]*\) fps,.*/\1/")
clipname=${(basename "$i")/\.*/}
ffmpeg -i "$i" -vcodec libx264 \
-vf drawtext="fontsize=15:fontfile=/usr/share/fonts/truetype/dejavuDejaVuSans.tff: \
timecode='00\:00\:00\:00':rate=$frame_rate:text='$clipname' TCR:':\
fontsize=72:fontcolor='white':boxcolor=0x000000AA:\
box=1:x=860-text_w/2:y=960" "${i/.mov/_tc.mov}"
done


./capture -d /dev/video1 -F -o -c -t 60 > video1.raw
/usr/share/pidash/bonecv/capture -d /dev/video0 -F -o -c 300 > video0.raw

ffmpeg -f -vcodec libx264 -i video0.mp4 \ -vf drawtext=»fontfile=arial.ttf:fontsize=14:fontcolor=white:box=1:boxcolor=black@0.9:x=08:y=466:text=’%%{localtime\: %%m/%%d/%%Y %%I.%%M.%%S %%p}'» video.mp4

avconv -framerate 30-i video0.raw -c:v copy my_video2.mp4
