#!/usr/bin/sh

swayidle -w \
	timeout 300 'brightnessctl g > /tmp/swayidle_brightness; brightnessctl set 20%' \
	resume 'brightnessctl set $(cat /tmp/swayidle_brightness)' \
	timeout 600 'systemctl suspend' \
	before-sleep 'swaylock -f '
