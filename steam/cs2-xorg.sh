#!/usr/bin/env bash

# Disable VPN
nmcli connection down wg1
nmcli connection down wg2
nmcli connection down wg3

# Disable Monitor
xrandr --output eDP-1 --off
xrandr --output DP-1 --off
xrandr --output DP-2 --off
xrandr --output DP-3 --off
xrandr --output DP-4 --off
xrandr --output DP-5 --off
xrandr --output DP-6 --off
xrandr --output DP-7 --off
xrandr --output DP-8 --off
xrandr --output DP-9 --mode 1280x960 --rate 60 --pos 0x0 --rotate normal

# Reload Qtile
# qtile cmd-obj -o cmd -f reload_config
