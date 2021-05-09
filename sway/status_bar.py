#!/usr/bin/python3
from datetime import datetime
from psutil import disk_usage, sensors_battery
from psutil._common import bytes2human
from socket import gethostname, gethostbyname_ex
from subprocess import check_output
from sys import stdout
from time import sleep

GET_IP_AND_MASK_COMMAND = "ip -4 address show | grep inet | grep -v 127.0.0.1 | awk '{print $2}'"

def write(data):
    stdout.write('%s\n' % data)
    stdout.flush()

def refresh():
    disk = bytes2human(disk_usage('/').free)
    #ip = gethostbyname_ex(gethostname())
    try:
        ip = check_output(GET_IP_AND_MASK_COMMAND, shell=True).strip().decode("utf-8").split('/')[0]
    except Exception:
        ip = None
    try:
        ssid = check_output("iwgetid -r", shell=True).strip().decode("utf-8")
        ssid = "(%s)" % ssid
    except Exception:
        ssid = "None"
    battery = int(sensors_battery().percent)
    status = "Charging" if sensors_battery().power_plugged else "Discharging"
    date = datetime.now().strftime('%h %d %A %H:%M')
    format = "Space: %s | Internet: %s %s | Battery: %s%% %s | Date: %s"
    write(format % (disk, ip, ssid, battery, status, date))

while True:
    refresh()
    sleep(1)
