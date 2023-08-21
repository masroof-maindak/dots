#!/bin/sh

case $(printf "%s\n" "Shut down" "Reboot" "Lock" "Logout" | tofi $@) in
	"Shut down")
		systemctl poweroff
		;;
	"Reboot")
		systemctl reboot
		;;
	"Lock")
	  swaylock -l -L -F --indicator-radius 80 --indicator-thickness 12 -e -i ~/Pictures/Wallpapers/lock.jpg
		;;
	"Logout")
	  hyprctl dispatch exit	
		;;
esac
