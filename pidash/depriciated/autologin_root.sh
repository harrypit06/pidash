Edit the file /lib/systemd/system/getty@.service and change the line

ExecStart=-/sbin/agetty --noclear %I $TERM
to

ExecStart=-/sbin/getty/ --noclear -a root %I $TERM