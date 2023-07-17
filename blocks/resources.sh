#!/bin/sh

# A dwm_bar function to display information regarding system memory, CPU temperature, and storage
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_resources () {
    # Used and total memory
    MEMUSED=$(free -h | awk '(NR == 2) {print $3}')
    MEMTOT=$(free -h |awk '(NR == 2) {print $2}')
    
    CPU=$[$(cat /sys/class/thermal/thermal_zone2/temp)/1000]

    printf "%s" "$SEP1"
    printf " 󰍛 MEM %s/%s | CPU %s " "$MEMUSED" "$MEMTOT" "$CPU"
    printf "%s\n" "$SEP2"
}

dwm_resources
