#! /bin/bash
PERCENT=$(upower -e | head -n 1 | xargs upower -i | grep percentage | awk '{print $2}')
echo "󰁹 $PERCENT"
