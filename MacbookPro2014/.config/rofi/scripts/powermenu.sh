#!/usr/bin/env bash

# Options
shutdown='Shut Down'
reboot='Reboot'
logout='Logout'

rofi_cmd() {
	rofi -dmenu \
		-theme $HOME/.config/rofi/powermenu.rasi
}

run_rofi() {
	echo -e "$logout\n$reboot\n$shutdown" | rofi_cmd
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
    $logout)
		bspc quit
        ;;
esac
