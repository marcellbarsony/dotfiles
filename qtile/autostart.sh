#!/bin/sh

# Check if application is running
run() {
  if ! pgrep $1 ; then
      $@&
  fi
}

# X Compositor
picom -b &

# Terminal
run kitty

# Displays & Wallapper
python /home/marci/.src/arch-tools/xtools/displays.py
python /home/marci/.src/arch-tools/xtools/wallpaper.py
