# https://qtile.readthedocs.io/en/stable/manual/config/screens.html

from libqtile import bar, widget
from libqtile.config import Screen
from colors import *
from mouse import *
from functions import *


screens = [
    # Screen 3
    Screen(
        top=bar.Bar([
            widget.GroupBox(
                active=PRIMARY,
                background=None,
                borderwidth=3,
                center_aligned=True,
                disable_drag=True,
                fontshadow=None,
                fontsize=14,
                hide_unused=False,
                highlight_color=['000000', '4A2996'],
                highlight_method='line',
                inactive=INACTIVE,
                margin_x=0,
                margin_y=3,
                rounded=False,
                this_current_screen_border=PRIMARY,
                this_screen_border=PRIMARY,
                urgent_border='FF0000',
                urgent_text='FF0000',
                ),
            # Window name
            widget.WindowName(
                background=None,
                fontsize=14,
                foreground=PRIMARY,
                max_chars=200,
                parse_text=window_name,
                scroll=False,
                scroll_delay=5,
                scroll_interval=0.1,
                scroll_repeat=True,
                scroll_step=1,
            ),

            # Spacer
            widget.Spacer(),

            # Weather
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                text_closed='☁',
                #text_closed='[]',
                text_opened='[Weather]',
                widgets=[
                    widget.OpenWeather(
                        location='Budapest',
                        format='{location_city} {main_temp}°{units_temperature} - {weather_details} {icon}',
                        foreground=PRIMARY,
                        update_interval=600
                        ),
                ]
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=2,
                padding=5,
                ),
            # Updates
            widget.CheckUpdates(
                colour_have_updates=PRIMARY,
                colour_no_updates=PRIMARY,
                display_format='Updates: {updates}',
                distro='Arch_Sup',
                initial_text='Checking updates...',
                foreground=PRIMARY,
                no_update_string='No updates',
                update_interval=3600,
                ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=2,
                padding=5,
                ),
            # Battery
            widget.Battery(
                battery=0,
                format='{char} {percent:2.0%} {hour:d}:{min:02d} {watt:.2f} W',
                foreground=PRIMARY,
                low_percentage=0.1,
                low_foregound='FF0000',
                update_interval=60,
                ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=2,
                padding=5,
                ),
            # Network
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                text_closed='[Network]',
                text_open='[Network]',
                widgets=[
                    # Network
                    widget.Net(
                        format='{down} ↓↑ {up}',
                        foreground=PRIMARY,
                        update_interval=5,
                        ),
                    widget.TextBox(
                        foreground=PRIMARY,
                        fmt = '@'
                        ),
                    # wlan
                    widget.Wlan(
                        foreground=PRIMARY,
                        format='{essid} ({percent:2.0%})',
                        interface='wlp1s0',
                        update_interval=60,
                        ),
                ]
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=2,
                padding=5,
                ),
            # RESOURCES
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                text_closed='[Resources]',
                text_open='[Resources]',
                widgets=[
                    # Disk Free
                    widget.DF(
                        foreground=PRIMARY,
                        format='{p} {uf}{m}',
                        visible_on_warn=False,
                        ),
                    widget.Sep(
                        foreground=INACTIVE,
                        ),
                    widget.CPU(
                        format='CPU: {load_percent}%',
                        foreground=PRIMARY,
                        mouse_callbacks={'Button1': open_sysmonitor},
                        update_interval=10
                        ),
                    widget.Sep(
                        foreground=INACTIVE,
                        ),
                    # RAM
                    widget.Memory(
                        format='RAM: {MemUsed:.0f}{mm}',
                        foreground=PRIMARY,
                        mouse_callbacks={'Button1': open_sysmonitor},
                        update_interval=10
                        ),
                    widget.Sep(
                        foreground=INACTIVE,
                        ),
                    # Thermal
                    widget.ThermalSensor(
                        format='{temp:.1f}{unit}',
                        foreground=PRIMARY,
                        threshold=60,
                        update_interval=30,
                        ),
                ]
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=2,
                padding=5,
                ),
            # Time & Date
            widget.Clock(
                format='%I:%M %p',
                foreground=PRIMARY,
                update_interval=60,
                ),
            ],
            24,
            border_width=[0, 0, 0, 0],
            border_color=['000000', '000000', '000000', '000000'],
            background='#16161E',
            margin=[3, 3, 0, 3],
            opacity=0.9,
        ),
    ),
    # Screen 1
    Screen(
        top=bar.Bar([
            widget.GroupBox(
                active=PRIMARY,
                background=None,
                borderwidth=5,
                center_aligned=True,
                disable_drag=True,
                fontshadow=None,
                fontsize=15,
                # foreground='FF0000',
                hide_unused=False,
                highlight_color=['030009', '4A2996'],
                highlight_method='line',
                inactive=INACTIVE,
                margin_x=0,
                margin_y=3,
                # other_current_screen_border='FFFFFF',
                # other_screen_border='FFFFFF',
                rounded=False,
                this_current_screen_border=PRIMARY,
                this_screen_border=PRIMARY,
                urgent_border='FF0000',
                urgent_text='FF0000',
                ),
            # Window name
            widget.WindowName(
                background=None,
                fontsize=14,
                foreground=PRIMARY,
                max_chars=250,
                parse_text=window_name,
                scroll=False,
                scroll_delay=5,
                scroll_interval=0.1,
                scroll_repeat=True,
                scroll_step=1,
                # width=800,
            ),

            # Spacer
            widget.Spacer(),

            # RIGHT
            # Weather
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                # text_closed='☁',
                text_closed='[<]',
                text_opened='[x]',
                widgets=[
                    widget.OpenWeather(
                        location='Budapest',
                        format='{location_city} {main_temp}°{units_temperature} - {weather_details} {icon}',
                        foreground=PRIMARY,
                        update_interval=600
                        ),
                ]
            ),
            widget.Sep(
                foreground=INACTIVE,
                ),
            # Updates
            widget.CheckUpdates(
                colour_have_updates=PRIMARY,
                colour_no_updates=PRIMARY,
                display_format='U: {updates}',
                distro='Arch_Sup',
                initial_text='Checking updates...',
                foreground=PRIMARY,
                no_update_string='No updates',
                update_interval=3600,
                ),
            widget.Sep(
                foreground=INACTIVE,
                ),
            # CPU
            widget.CPU(
                format='CPU: {load_percent}%',
                foreground=PRIMARY,
                mouse_callbacks={'Button1': open_sysmonitor},
                update_interval=10
                ),
            widget.Sep(
                foreground=INACTIVE,
                ),
            # RAM
            widget.Memory(
                format='RAM: {MemUsed:.0f}{mm}',
                foreground=PRIMARY,
                # measure_mem='G',
                mouse_callbacks={'Button1': open_sysmonitor},
                update_interval=10
                ),
            widget.Sep(
                foreground=INACTIVE,
                ),
            # Volume
            widget.Volume(
                foreground=PRIMARY,
                ),
            widget.Sep(
                foreground=INACTIVE,
                ),
            # Wlan
            # widget.Wlan(
            #     foreground=PRIMARY,
            #     # interface='enp0s3',

            #     ),
            # widget.Sep(
            #     foreground=INACTIVE,
            #     ),
            # Battery
            widget.Battery(
                battery=0,
                charge_char='^',
                discharge_char='V',
                format='BAT: {percent:2.0%}',
                foreground=PRIMARY,
                full_char='=',
                update_interval=60,
                ),
            widget.Sep(
                foreground=INACTIVE,
                ),
            # Time & Date
            widget.Clock(
                format='%I:%M %p',
                foreground=PRIMARY,
                update_interval=60,
                ),
            # System tray
            widget.Systray(),
            ],
            26,
            border_width=[0, 0, 0, 0],
            border_color=['000000', '000000', '000000', '000000'],
            background='#16161E',
            margin=[3, 3, 0, 3],
        ),
    ),

    # Screen 2
    Screen(
        top=bar.Bar([
            # LEFT
            # Groups
            widget.GroupBox(
                active=PRIMARY,
                background=None,
                borderwidth=5,
                center_aligned=True,
                disable_drag=True,
                fontshadow=None,
                fontsize=15,
                # foreground='FFFFFF',
                hide_unused=False,
                highlight_color=['030009', '4A2996'],
                highlight_method='line',
                inactive=INACTIVE,
                margin_x=0,
                margin_y=3,
                # other_current_screen_border='FF0000',
                # other_screen_border='FF0000',
                rounded=False,
                this_current_screen_border=PRIMARY,
                this_screen_border=PRIMARY,
                urgent_border='FF0000',
                urgent_text='FF0000',
                ),
            # Prompt
            widget.Prompt(),
            # Window name
            widget.WindowName(
                background=None,
                fontsize=14,
                foreground=PRIMARY,
                max_chars=500,
                parse_text=window_name,
                scroll=False,
                scroll_delay=5,
                scroll_interval=0.1,
                scroll_repeat=True,
                scroll_step=1,
                # width=800,
            ),
            # Disk Free
            widget.DF(
                foreground=PRIMARY,
                visible_on_warn=False,
                ),
            widget.Sep(
                foreground=INACTIVE,
                ),
            # Time & Date
            widget.Clock(
                foreground=PRIMARY,
                format='%a %b-%d',
                update_interval=60
                ),
            widget.Sep(
                foreground=INACTIVE,
                ),
            # Quick exit
            widget.QuickExit(
                countdown_format='[ {} seconds ]',
                countdown_start=5,
                default_text='[ Shutdown ]',
                foreground=PRIMARY,
                ),
            ],
            26,
            border_width=[0, 0, 0, 0],
            border_color=['000000', '000000', '000000', '000000'],
            background='#16161E',
            margin=[3, 5, 0, 5],
        ),
    ),

    # Screen 3
    Screen(
        top=bar.Bar([
            widget.GroupBox(
                active=PRIMARY,
                background=None,
                borderwidth=3,
                center_aligned=True,
                disable_drag=True,
                fontshadow=None,
                fontsize=14,
                hide_unused=False,
                highlight_color=['000000', '4A2996'],
                highlight_method='line',
                inactive=INACTIVE,
                margin_x=0,
                margin_y=3,
                rounded=False,
                this_current_screen_border=PRIMARY,
                this_screen_border=PRIMARY,
                urgent_border='FF0000',
                urgent_text='FF0000',
                ),
            # Window name
            widget.WindowName(
                background=None,
                fontsize=14,
                foreground=PRIMARY,
                max_chars=200,
                parse_text=window_name,
                scroll=False,
                scroll_delay=5,
                scroll_interval=0.1,
                scroll_repeat=True,
                scroll_step=1,
            ),

            # Spacer
            widget.Spacer(),

            # Weather
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                text_closed='☁',
                #text_closed='[]',
                text_opened='[Weather]',
                widgets=[
                    widget.OpenWeather(
                        location='Budapest',
                        format='{location_city} {main_temp}°{units_temperature} - {weather_details} {icon}',
                        foreground=PRIMARY,
                        update_interval=600
                        ),
                ]
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=2,
                padding=5,
                ),
            # Updates
            widget.CheckUpdates(
                colour_have_updates=PRIMARY,
                colour_no_updates=PRIMARY,
                display_format='Updates: {updates}',
                distro='Arch_Sup',
                initial_text='Checking updates...',
                foreground=PRIMARY,
                no_update_string='No updates',
                update_interval=3600,
                ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=2,
                padding=5,
                ),
            # Battery
            widget.Battery(
                battery=0,
                format='{char} {percent:2.0%} {hour:d}:{min:02d} {watt:.2f} W',
                foreground=PRIMARY,
                low_percentage=0.1,
                low_foregound='FF0000',
                update_interval=60,
                ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=2,
                padding=5,
                ),
            # Network
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                text_closed='[Network]',
                text_open='[Network]',
                widgets=[
                    # Network
                    widget.Net(
                        format='{down} ↓↑ {up}',
                        foreground=PRIMARY,
                        update_interval=5,
                        ),
                    widget.TextBox(
                        foreground=PRIMARY,
                        fmt = '@'
                        ),
                    # wlan
                    widget.Wlan(
                        foreground=PRIMARY,
                        format='{essid} ({percent:2.0%})',
                        interface='wlp1s0',
                        update_interval=60,
                        ),
                ]
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=2,
                padding=5,
                ),
            # RESOURCES
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                text_closed='[Resources]',
                text_open='[Resources]',
                widgets=[
                    # Disk Free
                    widget.DF(
                        foreground=PRIMARY,
                        format='{p} {uf}{m}',
                        visible_on_warn=False,
                        ),
                    widget.Sep(
                        foreground=INACTIVE,
                        ),
                    widget.CPU(
                        format='CPU: {load_percent}%',
                        foreground=PRIMARY,
                        mouse_callbacks={'Button1': open_sysmonitor},
                        update_interval=10
                        ),
                    widget.Sep(
                        foreground=INACTIVE,
                        ),
                    # RAM
                    widget.Memory(
                        format='RAM: {MemUsed:.0f}{mm}',
                        foreground=PRIMARY,
                        mouse_callbacks={'Button1': open_sysmonitor},
                        update_interval=10
                        ),
                    widget.Sep(
                        foreground=INACTIVE,
                        ),
                    # Thermal
                    widget.ThermalSensor(
                        format='{temp:.1f}{unit}',
                        foreground=PRIMARY,
                        threshold=60,
                        update_interval=30,
                        ),
                ]
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=2,
                padding=5,
                ),
            # Time & Date
            widget.Clock(
                format='%I:%M %p',
                foreground=PRIMARY,
                update_interval=60,
                ),
            ],
            24,
            border_width=[0, 0, 0, 0],
            border_color=['000000', '000000', '000000', '000000'],
            background='#16161E',
            margin=[3, 3, 0, 3],
            opacity=0.9,
        ),
    ),
]
