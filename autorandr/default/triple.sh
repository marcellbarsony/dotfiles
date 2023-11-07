#!/bin/sh
# xrandr --output eDP-1 --off
# xrandr --output HDMI-1 --off
# xrandr --output DP-1 --off
# xrandr --output DP-2 --off
# xrandr --output DP-3 --off
# xrandr --output DP-4 --off
# xrandr --output DP-5 --off
# xrandr --output DP-6 --off
xrandr --output DP-7 --mode 1920x1080 --rate 60 --pos 960x0 --rotate normal
xrandr --output DP-8 --mode 1920x1080 --rate 60 --pos 0x1080 --rotate normal
xrandr --output DP-9 --mode 1920x1080 --rate 60 --pos 1920x1080 --rotate normal
