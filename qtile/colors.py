with open("/home/marci/.cache/wal/colors", "r") as file:
    lines = file.readlines()

PRIMARY = lines[1].strip()
SECONDARY = lines[4].strip()

color1 = lines[0].strip()
color2 = lines[1].strip()
color3 = lines[2].strip()
color4 = lines[3].strip()
color5 = lines[4].strip()
color6 = lines[5].strip()
color7 = lines[6].strip()
color8 = lines[7].strip()
color9 = lines[8].strip()
color10 = lines[9].strip()
color11 = lines[10].strip()
color12 = lines[11].strip()
color13 = lines[12].strip()
color14 = lines[13].strip()
color15 = lines[14].strip()
color16 = lines[15].strip()

# PRIMARY = '#4A69DA'
# SECONDARY = '#7AA2F7'
INACTIVE = '#444444'

# GroupBox
highlight_color_1 = '#000000'
highlight_color_1 = '#000000'
inactive = '#444444'

# Battery
battery_low = '#FF0000'

# Bar Border
border_top = '#000000'
border_right = '#000000'
border_bottom = '#000000'
border_left = '#000000'
