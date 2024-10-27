#!/usr/bin/env bash

CHOSEN=$(printf "Lock\nShutdown\nReboot\nLog Out" | rofi -dmenu)

case "$CHOSEN" in
    "Lock")
        hyprlock ;;
    "Reboot")
        reboot ;;
    "Shutdown")
        poweroff ;;
    *)
        exit 1 ;;
esac

exit 0
