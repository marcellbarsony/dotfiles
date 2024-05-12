#!/usr/bin/env bash

# Disable VPN
nmcli connection down wg1
nmcli connection down wg2
nmcli connection down wg3

# Allow tearing (breaks game on startup)
# hyprctl keyword general:allow_tearing true

# Disable Monitor
hyprctl keyword monitor eDP-1,disable
hyprctl keyword monitor DP-7,disable
hyprctl keyword monitor DP-8,disable
hyprctl keyword monitor DP-9,1280x960@60,1920x1080,1

# Disable programs
killall eww
killall dunst
