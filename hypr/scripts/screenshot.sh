#!/bin/bash

folder="/home/marci/tmp/screenshots"

if [[ ! -d "$folder" ]]; then
  mkdir -p "$folder"
fi

grim -g "$(slurp)" "$folder"/"$(date +%Y%m%d-%H%M%S)".png

exit 0
