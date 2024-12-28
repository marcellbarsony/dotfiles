#!/usr/bin/env bash

# Discover files {{{
find_files() {
    shopt -s nullglob dotglob # Hidden files & empty directories
    for file in "$1"/*; do
        if [ -d "$file" ]; then
            find_files "$file" # Recursively call subdirectories
        else
            echo "$file" # Print each file path
        fi
    done
}

dir="/home/$USER/Downloads/backgrounds"
files=( $(find_files "$dir") ) # Capture files in an array using process substitution

if [[ ${#files[@]} -eq 0 ]]; then
    echo "Directory empty: $dir"
else
    random_index=$(( RANDOM % ${#files[@]} )) # Get random index within the array bounds
    random_file=${files[$random_index]} # Get random file by index
fi
# }}}

# Cache {{{
CACHE_DIR="/home/marci/.cache/wallpaper"

if [ ! -d "$DIR" ]; then
  echo "Directory does not exist. Creating it now..."
  mkdir -p "$DIR"
  echo "Directory created: $DIR"
else
  echo "Directory already exists: $DIR"
fi
# }}}

# Transitions {{{
transitions=("simple" "any" "wipe" "outer" "grow" "random")
random_index=$((RANDOM % ${#transitions[@]}))
random_transition=${transitions[$random_index]}
# }}}

# Wallpaper {{{
swww img $random_file \
    --transition-angle=45 \
    --transition-bezier .43,0.19,1,.4 \
    --transition-duration=2 \
    --transition-fps=60 \
    --transition-type=$random_transition \
# }}}

# Color scheme {{{
matugen image $random_file
# }}}

# Notification {{{
# notify-send "SWWW" "${random_file##*/}"
# }}}

exit 0
