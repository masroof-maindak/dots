#!/usr/bin/env bash

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"

# Options
shutdown=''
reboot=''
lock=''
logout=''

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-mesg "Uptime: $uptime" \
		-theme $HOME/.config/rofi/powermenu.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-theme ${dir}/${theme}.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$lock\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	if [[ $1 == '--shutdown' ]]; then
		systemctl poweroff
	elif [[ $1 == '--reboot' ]]; then
		systemctl reboot
	elif [[ $1 == '--logout' ]]; then
    wm="`wmctrl -m | grep Name | awk -F': ' '{print $2}'`"
		if [[ "$wm" == 'berry' ]]; then
		  berryc quit	
		elif [[ "$wm" == 'bspwm' ]]; then
			bspc quit
		elif [[ "$wm" == 'i3' ]]; then
			i3-msg exit
		fi
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
		if [[ -x '/usr/bin/betterlockscreen' ]]; then
			betterlockscreen -l
		elif [[ -x '/usr/bin/i3lock' ]]; then
			i3lock
		fi
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
