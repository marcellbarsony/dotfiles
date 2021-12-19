#!/bin/sh

# Scenario
prompt="Powermenu"
scenario1="shutdown now"
scenario2="shutdown -r now"
scenario3="loginctl kill-session $XDG_SESSION_ID"

# Theme
nb="#111111"
nf="#FFFFFF"
sb="#F243FF"
sf="#000000"
px=28

select=$(printf "Cancel\nShutdown\nReboot\nKill_X11" | dmenu -i --nb $nb --nf $nf --sb $sb --sf $sf --render_minheight $px -p "$prompt")

if [ "$select" = "Shutdown" ]; then
    $scenario1
  elif [ "$select" = "Reboot" ]; then
    $scenario2
  elif [ "$select" = "Kill_X11" ]; then
    $scenario3
  else
    echo "Powermenu terminated" && exit 1
fi

