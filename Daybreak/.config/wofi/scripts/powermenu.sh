#!/bin/bash

op=$( echo -e "  Poweroff\n  Reboot\n  Logout\n  Lock" | wofi --show dmenu --width 250 --height 200 --style=$HOME/.config/wofi/powermenu.css /dev/null | awk '{print tolower($2)}' )

case $op in 
        poweroff)
                poweroff
                ;;
        reboot)
                reboot
                ;;
        lock)
                swaylock -i ~/Pictures/Wallpapers/Drifter.png
                ;;
        logout)
                hyprctl dispatch exit
                ;;
esac
