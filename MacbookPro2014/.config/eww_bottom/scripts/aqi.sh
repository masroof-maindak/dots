#!/bin/sh

TOKEN="8e8ce15e455da87424d3cb11723d60c823ea5dc6"
CITY="Lahore"
API="https://api.waqi.info/feed"
aqi=$(curl -sf "$API/$CITY/?token=$TOKEN")
if [ -n "$aqi" ]; then
    if [ "$(echo "$aqi" | jq -r '.status')" = "ok" ]; then
        aqi=$(echo "$aqi" | jq '.data.aqi')
        echo "$aqi"
    else
        echo "$aqi" | jq -r '.data'
    fi
fi
