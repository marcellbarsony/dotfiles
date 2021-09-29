#!/usr/bin/env bash

# Terminate already running bar instances

killall -q polybar

# Default launch

#echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
#polybar example 2>&1 | tee -a /tmp/polybar1.log & disown
#echo "Bars launched..."

# Launch Polybar on every connected monitor

#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d " " -f1); do
#    MONITOR=$m polybar --reload example &
#  done
#else
#    polybar --reload example &
#fi

# Launch bar based on monitor

MONITOR="eDP1" polybar --reload example &
MONITOR="HDMI2" polybar --reload example2 &
MONITOR="DP1" polybar --reload example &