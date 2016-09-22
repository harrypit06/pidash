killall gpsd
gpsd /dev/ttyS0 -F /var/run/gpsd.sock
gpxlogger -d -f /media/sda1/GPS_Log/$(date +"%m_%d_%Y_%H_%M").txt -m 50