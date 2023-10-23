#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [[ "$player_status" = "Playing" || "$player_status" = "Paused" ]]; then
    echo "$(playerctl metadata title) ~ $(playerctl metadata artist)"
else
    echo ""
fi
