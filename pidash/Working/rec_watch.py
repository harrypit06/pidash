import commands

#output = commands.getoutput('ps -ef')

while True:
    output = commands.getoutput('ps -ef')
    if '/usr/share/pidash/bonecv/capture' in output:
        print "recording"
        execfile('/usr/share/pidash/LED_REC_ON.py')
        time.sleep(1)

    else:
        print "not recording"
        execfile('/usr/share/pidash/LED_REC_OFF.py')
        time.sleep(1)
