#!/usr/bin/env bash

OUT=$(printf "Lock\nShutdown\nReboot\nLog Out" | rofi -dmenu)

case "$OUT" in
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
