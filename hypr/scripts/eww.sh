#!/usr/bin/bash

killall eww

MONITORS=$(hyprctl monitors -j | jq '.[] | .id') # jq > jaq

for num in $MONITORS; do
    eww open bar$num
done

exit 0
