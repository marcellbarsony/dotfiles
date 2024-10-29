#!/usr/bin/env bash

LOCK="Hyprlock"
LOGOUT="Log out"
REBOOT="Reboot"
SHUTDOWN="Poweroff"

OUT=$(printf "$LOCK\n$SHUTDOWN\n$REBOOT\n$LOGOUT" | rofi -dmenu)

case "$OUT" in
    "${LOCK}")
        hyprlock ;;
    "$REBOOT")
        reboot ;;
    "$SHUTDOWN")
        poweroff ;;
    "$LOGOUT")
        hyprctl dispatch exit ;;
    *)
        exit 1 ;;
esac

exit 0
