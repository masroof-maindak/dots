eval "$(bspc query -T -n | jq -r '"
    X=\(.client.floatingRectangle.x+(.client.floatingRectangle.width/2)-1280)
    Y=\(.client.floatingRectangle.y+(.client.floatingRectangle.height/2)-800)
"')"

# Remove decimal part
X=$(echo "$X" | awk '{ printf("%.0f\n", $1) }')
Y=$(echo "$Y" | awk '{ printf("%.0f\n", $1) }')
bspc node -v $((X * -1)) $((Y * -1))