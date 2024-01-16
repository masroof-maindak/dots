#!/usr/bin/env bash

shutdown='Shut Down'
reboot='Reboot'
logout='Logout'

ans="$(echo -e "$logout\n$reboot\n$shutdown" | rofi -dmenu -theme $HOME/.config/rofi/powermenu.rasi)"

case ${ans} in
    $shutdown)
		systemctl poweroff
        ;;
    $reboot)
		systemctl reboot
        ;;
    $logout)
		bspc quit
        ;;
esac
