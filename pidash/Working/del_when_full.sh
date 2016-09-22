#!/bin/bash
FILESYSTEM=/media/sda1 # or whatever filesystem to monitor
CAPACITY=95 # delete if FS is over 95% of usage
CACHEDIR=/home/pi/delete_cache/
FREE="$(df -k --output=pcent /media/sda1)"

# Proceed if filesystem capacity is over than the value of CAPACITY (using df POSIX syntax)
# using [ instead of [[ for better error handling.
if [ $(df -P $FILESYSTEM | awk '{ gsub("%",""); capacity = $5 }; END { print capacity }') -$
then
    # lets do some secure removal (if $CACHEDIR is empty or is not a directory find will ex$
    # with error which is quite safe for missruns.):
    find "$CACHEDIR" --maxdepth 1 --type f -exec rm -f {} \;
    # remove "maxdepth and type" if you want to do a recursive removal of files and dirs
    find "$CACHEDIR" -exec rm -f {} \;
else
echo "No need to delete. Storage is not full"
fi