#!/usr/bin/env bash

# Options
shutdown='Shut Down'
reboot='Reboot'
lock='Lock'
logout='Logout'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-theme $HOME/.config/rofi/powermenu.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		systemctl poweroff
        ;;
    $reboot)
		systemctl reboot
        ;;
    $lock)
		i3lock
        ;;
    $logout)
		i3-msg exit
        ;;
esac
