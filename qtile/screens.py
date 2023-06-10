# https://qtile.readthedocs.io/en/stable/manual/config/screens.html

from libqtile import bar, widget
from libqtile.config import Screen
from colors import *
from mouse import *
from functions import network_ip, network_interface, window_name
from variables import font_size, sep_padding, sep_width


screens = [
    # SCREEN1
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

    # SCREEN2
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

    # SCREEN3
    Screen(
        top=bar.Bar([
            # LEFT
            widget.GroupBox(
                active=PRIMARY,
                background=None,
                borderwidth=3,
                center_aligned=True,
                disable_drag=True,
                fontshadow=None,
                fontsize=font_size,
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
            widget.WindowName(
                background=None,
                fontsize=font_size,
                foreground=PRIMARY,
                max_chars=200,
                parse_text=window_name,
                scroll=False,
                scroll_delay=5,
                scroll_interval=0.1,
                scroll_repeat=True,
                scroll_step=1,
            ),

            widget.Spacer(),

            # RIGHT
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                text_closed='☁',
                text_opened='[>]',
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
                linewidth=sep_width,
                padding=sep_padding,
            ),
            widget.CheckUpdates(
                colour_have_updates=PRIMARY,
                colour_no_updates=PRIMARY,
                display_format='Updates: {updates}',
                distro='Arch_Sup',
                initial_text='Checking updates...',
                foreground=PRIMARY,
                no_update_string='Updated',
                update_interval=3600,
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                text_closed='[Network]',
                text_open='[Network]',
                widgets=[
                    widget.Net(
                        format='{down} ↓↑ {up}',
                        foreground=PRIMARY,
                        update_interval=5,
                        ),
                    widget.Wlan(
                        foreground=PRIMARY,
                        format=' @{essid} ({percent:2.0%})',
                        interface='wlp1s0',
                        update_interval=60,
                    ),
                    widget.GenPollText(
                        func=network_ip,
                        foreground=PRIMARY,
                        update_interval=600,
                    ),
                    widget.GenPollText(
                        func=network_interface,
                        foreground=PRIMARY,
                        update_interval=600,
                    ),
                ]
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
                ),
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                text_closed='[Resources]',
                text_open='[Resources]',
                widgets=[
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[Battery]',
                        text_open='[Battery]',
                        widgets=[
                            widget.Battery(
                                battery=0,
                                format='BAT: {char}{percent:2.0%} {watt:.2f}W {hour:d}h{min:02d}m left',
                                foreground=PRIMARY,
                                low_percentage=0.1,
                                low_foregound='FF0000',
                                update_interval=60,
                            ),
                        ]
                    ),
                    widget.DF(
                        foreground=PRIMARY,
                        format='MEM: {p} {uf}{m}',
                        visible_on_warn=False,
                    ),
                    widget.CPU(
                        format='CPU: {load_percent}%',
                        foreground=PRIMARY,
                        mouse_callbacks={'Button1': open_sysmonitor},
                        update_interval=10
                    ),
                    widget.Memory(
                        format='RAM: {MemUsed:.0f}{mm}',
                        foreground=PRIMARY,
                        mouse_callbacks={'Button1': open_sysmonitor},
                        update_interval=10
                    ),
                    widget.ThermalSensor(
                        format='{temp:.1f}{unit}', # TODO
                        foreground=PRIMARY,
                        threshold=60,
                        update_interval=30,
                    ),
                ]
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
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
