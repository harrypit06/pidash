echo "# gps ntp
server 127.127.28.0 minpoll 4
fudge  127.127.28.0 time1 0.183 refid NMEA
server 127.127.28.1 minpoll 4 prefer
fudge  127.127.28.1 refid PPS" >> /etc/ntp.conf


sudo service ntp restart