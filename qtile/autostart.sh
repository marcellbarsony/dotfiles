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
