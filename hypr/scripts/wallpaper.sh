#!/usr/bin/bash

find_files() {
  shopt -s nullglob dotglob  # Hidden files and empty directories
  for file in "$1"/*; do
    if [ -d "$file" ]; then
      find_files "$file"  # Recursively call for subdirectories
    else
      echo "$file"  # Print each file path
    fi
  done
}

dir="/home/marci/tmp/backgrounds"
files=( $(find_files "$dir") ) # Capture files in an array using process substitution

if [[ ${#files[@]} -eq 0 ]]; then
  echo "No files found in $dir"
else
  random_index=$(( RANDOM % ${#files[@]} )) # Get random index within the array bounds
  random_file=${files[$random_index]} # Get random file by index
fi

transitions=("wipe" "outer" "random")
random_index=$((RANDOM % ${#transitions[@]}))
random_transition=${transitions[$random_index]}

# Wallpaper
swww img $random_file \
    --transition-bezier .43,0.19,1,.4 \
    --transition-fps=60 \
    --transition-type=$random_transition \
    --transition-duration=1 \

# Color scheme
matugen image $random_file

# Notification
notify-send "SWWW" "${random_file##*/}"

exit 0
