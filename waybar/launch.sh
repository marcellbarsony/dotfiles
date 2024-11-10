# Waybar
# https://github.com/Alexays/Waybar

killall waybar

if [[ $USER = "marci" ]]
then
    pgrep waybar || waybar -c ~/.config/waybar/config.jsonc
else
    waybar &
fi
