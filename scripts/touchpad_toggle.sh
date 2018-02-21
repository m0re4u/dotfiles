#!/bin/bash

state=`synclient -l | fgrep TouchpadOff | sed 's/^.*= //'`
if [ $state -eq 1 ]; then
        synclient TouchpadOff=0
        notify-send "Turned on touchpad" -t 2000
else
        synclient TouchpadOff=1
        notify-send "Turned off touchpad" -t 2000
fi
