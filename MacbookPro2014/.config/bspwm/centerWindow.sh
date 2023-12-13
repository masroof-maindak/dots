eval "$(bspc query -T -n | jq -r '"X=\(.client.floatingRectangle.x+(.client.floatingRectangle.width/2)-1280)\nY=\(.client.floatingRectangle.y+(.client.floatingRectangle.height/2)-800)"')"
# Remove decimal part if it's .5
X=$(echo "$X" | awk '{ printf("%.0f\n", $1) }')
Y=$(echo "$Y" | awk '{ printf("%.0f\n", $1) }')
dx=$((X * -1))
dy=$((Y * -1))
bspc node -v $dx $dy

