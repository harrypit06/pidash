#!/bin/bash
sed -i "gpu_mem=128" /boot/config.txt

grep -q "^FOOBAR=" /boot/config.txt && sed "s/^FOOBAR=.*/FOOBAR=newvalue/" -i /boot/config.txt || 
    sed "$ a\FOOBAR=newvalue" -i /boot/config.txt