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
#python /home/marci/.src/arch-tools/xtools/wallpaper.py
python /home/marci/.src/arch-tools/xtools/setwallpaper.py
xwallpaper --output eDP-1 --stretch $HOME/Pictures/4k/cyberpunk/4k_cyberpunk_city_2.jpg
