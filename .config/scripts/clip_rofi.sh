#!/usr/bin/sh

SELECTION=$(cliphist list | rofi -dmenu -i -p "Clipboard")

if [[ -n "$SELECTION" ]]; then
	echo "$SELECTION" | cliphist decode | wl-copy
fi
