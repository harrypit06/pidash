import os
from datetime import datetime, timedelta
import time

current_time = datetime.now() - timedelta(0,13)
mod_time = datetime.fromtimestamp(os.stat('/media/sda1/Video_Front').st_mtime)

while True:
	if mod_time < current_time:
		print "Not recording"
		current_time = datetime.now() - timedelta(0,199)
		mod_time = datetime.fromtimestamp(os.stat('/media/sda1/Video_Front').st_mtime)
		execfile('/usr/share/pidash/LED_REC_OFF.py')
		time.sleep(1)

	else:
		print "Recording"
		current_time = datetime.now() - timedelta(0,199)
		mod_time = datetime.fromtimestamp(os.stat('/media/sda1/Video_Front').st_mtime)
		execfile('/usr/share/pidash/LED_REC_ON.py')
		time.sleep(1)