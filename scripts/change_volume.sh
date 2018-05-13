#!/bin/bash

# Choose the effect
case "$1" in

  up)
    pactl set-sink-volume 1 +5%
    paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
    ;;
  down)
    pactl set-sink-volume 1 -5%
    paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
    ;;
  toggle)
    pactl set-sink-mute 1 toggle
    ;;
  *)
    echo -ne "Usage : change_volume <up|down|mute>\n"
    exit 1 ;; # exit with error
esac
