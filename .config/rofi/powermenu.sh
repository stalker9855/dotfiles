#! /usr/bin/bash
#
chosen=$(printf "󰐥 Power Off\n Restart\n󰤄 Suspend\n Lock" | rofi -dmenu -i -p "Powermenu")
case "$chosen" in 
	"󰐥 Power Off") shutdown now;;
	" Restart") reboot ;;
     "󰤄 Suspend") systemctl suspend ;;
    " Lock") betterlockscreen -l dim ;;
	*) exit 1 ;;
esac
