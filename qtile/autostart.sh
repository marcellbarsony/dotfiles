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
python /home/marci/.local/bin/xdisplay.py
python /home/marci/.local/bin/xwall.py -r
