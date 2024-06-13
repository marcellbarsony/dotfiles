# Launch Waybar

killall waybar

if [[ $USER = "marci" ]]
then
    waybar -c ~/.config/waybar/config.jsonc
    # pgrep waybar || waybar -c ~/.config/waybar/config.jsonc
else
    waybar &
fi
