#!/bin/sh

# Check if application is running
run() {
  if ! pgrep $1 ; then
      $@&
  fi
}

# Applications
picom -b &
run kitty
python /home/marci/.src/arch-tools/xtools/displays.py
python /home/marci/.src/arch-tools/xtools/wallpaper.py
