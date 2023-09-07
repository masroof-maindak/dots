rofi_cmd() {
        rofi -dmenu \
                -theme $HOME/.config/rofi/powermenu.rasi
}

# Pass variables to rofi dmenu
run_rofi() {
        echo -e "Lock\nLogout\nReboot\nShut Down" | rofi_cmd
}

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
