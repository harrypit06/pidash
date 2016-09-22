#!/bin/bash
dir=/usr/share/pidash/cache/Video_Rear
target=/media/sda1/Video_Rear

mv /usr/share/pidash/cache/Video_Rear/*.raw /media/sda1/Video_Rear
inotifywait -m "$dir" --format '%w%f' -e create |
    while read file; do
        sleep 61s
        mv "$file" "$target"
    done