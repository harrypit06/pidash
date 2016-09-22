#!/bin/bash
dir=/usr/share/pidash/cache/Video_Front
target=/media/sda1/Video_Front

mv /usr/share/pidash/cache/Video_Front/*.raw /media/sda1/Video_Front
inotifywait -m "$dir" --format '%w%f' -e create |
    while read file; do
        sleep 61s
        mv "$file" "$target"
    done