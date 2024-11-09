#! /bin/bash

CURRENT_LAYOUT=$(setxkbmap -model pc105 -query | awk -F : 'NR==3{print $2}' | sed 's/ //g')

if [ "$CURRENT_LAYOUT" = "us" ]; then
    setxkbmap "ru"
    notify-send "Lang: RU" -t 700
elif [ "$CURRENT_LAYOUT" = "ru" ]; then
    setxkbmap "ua"
    notify-send "Lang: UA" -t 700
else
    setxkbmap "us"
    notify-send "Lang: US" -t 700
fi
