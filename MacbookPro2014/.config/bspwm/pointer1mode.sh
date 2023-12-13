mode=$(eww get mode)
mode=$(if [ "$mode" = "move" ]; then
    echo "resize_corner"
else
    echo "move"
fi)
bspc config pointer_action1 "$mode"
eww update mode="$mode"
