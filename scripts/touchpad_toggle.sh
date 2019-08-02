#!/bin/bash

device="SYN1B7F:00 06CB:CD41 Touchpad"
state=$(xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$")
if [ "$state" == "1" ]; then
        xinput --disable "$device"
        notify-send "Turned off touchpad" -t 2000
else
        xinput --enable "$device"
        notify-send "Turned on touchpad" -t 2000
fi
