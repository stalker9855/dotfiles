#!/usr/bin/sh

LOCK="Lock"
LOGOUT="Log out"
SUSPEND="Suspend"
REBOOT="Reboot"
SHUTDOWN="Shutdown"

CHOSEN=$(printf "%s\n%s\n%s\n%s\n%s" "$LOCK" "$SUSPEND" "$LOGOUT" "$REBOOT" "$SHUTDOWN" | rofi -dmenu -i -p "Power Menu" -l 5)

case "$CHOSEN" in
	"$LOCK")
		swaylock -f
		;;
	"$SUSPEND")
		systemctl suspend
		;;
	"$LOGOUT")
		;;
	"$REBOOT")
		systemctl reboot
		;;
	"$SHUTDOWN")
		systemctl poweroff
		;;
esac


