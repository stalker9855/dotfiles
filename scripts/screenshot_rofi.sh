#!/usr/bin/sh


REGION="Region"
DESKTOP="Desktop"

CHOSEN=$(printf "%s\n%s" "$REGION" "$DESKTOP" | rofi -dmenu -i -p "Make screenshot" -l 3)

case "$CHOSEN" in
	"$DESKTOP")
		grim - | wl-copy && notify-send "Screenshot" "Copy to clipboard"
		;;
	"$REGION")
		GEOM=$(slurp)
		if [[ -n "$GEOM" ]]; then
		grim -g "$GEOM" - | wl-copy && notify-send "Screenshot" "Copy to clipboard"
		fi
		;;
esac



