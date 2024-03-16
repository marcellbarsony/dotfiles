# https://qtile.readthedocs.io/en/stable/manual/config/screens.html
# https://docs.qtile.org/en/stable/manual/ref/widgets.html

from libqtile import bar, widget
from libqtile.config import Screen
from colors import *
from mouse import *
from func_screens import window_name
from func_audio import audio_increase, audio_decrease, audio_mute
from func_backlight import backlight_increase, backlight_decrease
from func_network import network_ip, network_interface, network_gateway
from variables import font_size, sep_padding, sep_width, widget_padding


widget_defaults = dict(
    font="JetBrainsMono Nerd Font Mono",
    fontsize=14,
    padding=0,
)
extension_defaults = widget_defaults.copy()

screens = [

    # {{{ SCREEN-1
    Screen(
        top=bar.Bar([

            # {{{ Groups
            widget.GroupBox(
                active=PRIMARY,
                background=None,
                borderwidth=3,
                center_aligned=True,
                disable_drag=True,
                fontshadow=None,
                fontsize=font_size,
                hide_unused=False,
                highlight_color=[highlight_color_1, INACTIVE],
                highlight_method='line',
                inactive=inactive,
                margin_x=0,
                margin_y=5,
                padding_x=5,
                rounded=False,
                this_current_screen_border=PRIMARY,
                this_screen_border=PRIMARY,
                urgent_border='FF0000',
                urgent_text='FF0000',
            ),
            # }}}

            # {{{ Windown Name
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
            # }}}

            # {{{ Settings
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                fontsize=20,
                text_closed='󰄽',
                text_open='󰄾',
                widgets=[
                    # {{{ Weather
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[  Weather ]',
                        text_open='[  Weather ]',
                        widgets=[
                            widget.OpenWeather(
                                location='Budapest',
                                format='{location_city} {main_temp}°{units_temperature} - {weather_details} {icon}',
                                foreground=PRIMARY,
                                update_interval=600
                            ),
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                        ]
                    ),
                    # }}}

                    # Network {{{
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[  Network ]',
                        text_open='[  Network ]',
                        widgets=[
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),

                            # {{{ Interface
                            widget.TextBox(
                                fmt='󱫋',
                                fontsize=20,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.GenPollText(
                                func=network_interface,
                                foreground=PRIMARY,
                                update_interval=600,
                            ),
                            # }}}

                            # {{{ IP
                            widget.TextBox(
                                fmt='󰩟',
                                fontsize=20,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.GenPollText(
                                func=network_ip,
                                foreground=PRIMARY,
                                update_interval=600,
                            ),
                            # }}}

                            # {{{ Wlan
                            widget.TextBox(
                                fmt='󰖩',
                                fontsize=20,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.Wlan(
                                foreground=PRIMARY,
                                format='{essid} ({percent:2.0%})',
                                interface='wlp1s0',
                                update_interval=60,
                            ),
                            # }}}

                            # {{{ Gateway
                            widget.TextBox(
                                fmt='󱇢',
                                fontsize=20,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.GenPollText(
                                func=network_gateway,
                                foreground=PRIMARY,
                                update_interval=600,
                            ),
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                            # }}}

                        ]
                    ),
                    # }}}

                    # {{{ XBacklight
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[ 󰌵 Xlight ]',
                        text_open='[ 󰌵 Xlight ]',
                        widgets=[
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': backlight_increase},
                            ),
                            widget.TextBox(
                                fontsize=20,
                                foreground=PRIMARY,
                                fmt='  ',
                                mouse_callbacks={'Button1': backlight_decrease},
                            ),
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                        ]
                    ),
                    ### }}}

                    # {{{ Audio
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[  Audio ]',
                        text_open='[  Audio ]',
                        widgets=[
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_mute},
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_increase},
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_decrease},
                            ),
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                        ]
                    ),
                    widget.Sep(
                        foreground=inactive,
                        linewidth=sep_width,
                        padding=sep_padding,
                    ),
                    # }}}
                ]
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ NETWORK
            widget.Net(
                format='{down:.0f}{down_suffix}  {up:.0f}{up_suffix}',
                foreground=PRIMARY,
                update_interval=10,
                use_bits=True,
                ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ CPU
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=20,
                fmt='',
                padding=widget_padding,
            ),
            widget.CPU(
                format='{load_percent}% ',
                foreground=PRIMARY,
                mouse_callbacks={'Button1': open_sysmonitor},
                update_interval=10,
            ),
            widget.ThermalSensor(
                foreground=PRIMARY,
                format=' {temp:.0f}',
                tag_sensor='CPU',
                threshold=80,
                update_interval=30,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ RAM
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=20,
                fmt='',
                padding=widget_padding,
            ),
            widget.Memory(
                format='{MemUsed:.0f}{mm}',
                foreground=PRIMARY,
                measure_mem = 'G',
                mouse_callbacks={'Button1': open_sysmonitor},
                update_interval=10
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ DF
            widget.DF(
                foreground=PRIMARY,
                format=' {uf}{m}',
                partition="/",
                visible_on_warn=False,
                warn_color='FF0000',
                warn_space=20,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ PACKAGES
            widget.TextBox(
                fmt='',
                foreground=PRIMARY,
                fontsize=20,
                margin=15,
                mouse_callbacks={'Button1': open_pacman},
                padding=widget_padding,
            ),
            widget.CheckUpdates(
                colour_have_updates=PRIMARY,
                colour_no_updates=PRIMARY,
                display_format='{updates}',
                distro='Arch',
                foreground=PRIMARY,
                initial_text='Checking updates...',
                no_update_string='0',
                update_interval=3600,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ CLOCK
            widget.Clock(
                foreground=PRIMARY,
                format='%I:%M %p',
                padding=widget_padding,
                update_interval=60,
            ),
            # }}}

            # {{{ BATTERY
            widget.Battery(
                battery=0,
                charge_char='󰚥',
                discharge_char='󱐋',
                format='{char} {percent:2.0%}',
                foreground=PRIMARY,
                full_char = '󰁹',
                low_percentage=0.2,
                low_foregound=battery_low,
                not_charging_char='󰁹',
                padding=widget_padding,
                show_short_text=False,
                update_interval=60,
                hide_threshold=0.9,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            ],
            20,
            background='#000000',
            border_color=[border_top, border_right, border_bottom, border_left],
            border_width=[0, 0, 0, 0],
            margin=[0, 0, 0, 0],
            opacity=0.9,
        ),
    ),
    # }}}

    # {{{ SCREEN-2
    Screen(
        top=bar.Bar([

            # {{{ Groups
            widget.GroupBox(
                active=PRIMARY,
                background=None,
                borderwidth=3,
                center_aligned=True,
                disable_drag=True,
                fontshadow=None,
                fontsize=font_size,
                hide_unused=False,
                highlight_color=[highlight_color_1, INACTIVE],
                highlight_method='line',
                inactive=inactive,
                margin_x=0,
                margin_y=5,
                padding_x=5,
                rounded=False,
                this_current_screen_border=PRIMARY,
                this_screen_border=PRIMARY,
                urgent_border='FF0000',
                urgent_text='FF0000',
            ),
            # }}}

            # {{{ Windown Name
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
            # }}}

            # {{{ Settings
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                fontsize=20,
                text_closed='󰄽',
                text_open='󰄾',
                widgets=[
                    # {{{ Weather
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[  Weather ]',
                        text_open='[  Weather ]',
                        widgets=[
                            widget.OpenWeather(
                                location='Budapest',
                                format='{location_city} {main_temp}°{units_temperature} - {weather_details} {icon}',
                                foreground=PRIMARY,
                                update_interval=600
                            ),
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                        ]
                    ),
                    # }}}

                    # Network {{{
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[  Network ]',
                        text_open='[  Network ]',
                        widgets=[
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),

                            # {{{ Interface
                            widget.TextBox(
                                fmt='󱫋',
                                fontsize=20,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.GenPollText(
                                func=network_interface,
                                foreground=PRIMARY,
                                update_interval=600,
                            ),
                            # }}}

                            # {{{ IP
                            widget.TextBox(
                                fmt='󰩟',
                                fontsize=20,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.GenPollText(
                                func=network_ip,
                                foreground=PRIMARY,
                                update_interval=600,
                            ),
                            # }}}

                            # {{{ Wlan
                            widget.TextBox(
                                fmt='󰖩',
                                fontsize=20,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.Wlan(
                                foreground=PRIMARY,
                                format='{essid} ({percent:2.0%})',
                                interface='wlp1s0',
                                update_interval=60,
                            ),
                            # }}}

                            # {{{ Gateway
                            widget.TextBox(
                                fmt='󱇢',
                                fontsize=20,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.GenPollText(
                                func=network_gateway,
                                foreground=PRIMARY,
                                update_interval=600,
                            ),
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                            # }}}

                        ]
                    ),
                    # }}}

                    # {{{ XBacklight
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[ 󰌵 Xlight ]',
                        text_open='[ 󰌵 Xlight ]',
                        widgets=[
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': backlight_increase},
                            ),
                            widget.TextBox(
                                fontsize=20,
                                foreground=PRIMARY,
                                fmt='  ',
                                mouse_callbacks={'Button1': backlight_decrease},
                            ),
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                        ]
                    ),
                    ### }}}

                    # {{{ Audio
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[  Audio ]',
                        text_open='[  Audio ]',
                        widgets=[
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_mute},
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_increase},
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_decrease},
                            ),
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                        ]
                    ),
                    widget.Sep(
                        foreground=inactive,
                        linewidth=sep_width,
                        padding=sep_padding,
                    ),
                    # }}}
                ]
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ NETWORK
            widget.Net(
                format='{down:.0f}{down_suffix}  {up:.0f}{up_suffix}',
                foreground=PRIMARY,
                update_interval=10,
                use_bits=True,
                ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ CPU
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=20,
                fmt='',
                padding=widget_padding,
            ),
            widget.CPU(
                format='{load_percent}% ',
                foreground=PRIMARY,
                mouse_callbacks={'Button1': open_sysmonitor},
                update_interval=10,
            ),
            widget.ThermalSensor(
                foreground=PRIMARY,
                format=' {temp:.0f}',
                tag_sensor='CPU',
                threshold=80,
                update_interval=30,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ RAM
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=20,
                fmt='',
                padding=widget_padding,
            ),
            widget.Memory(
                format='{MemUsed:.0f}{mm}',
                foreground=PRIMARY,
                measure_mem = 'G',
                mouse_callbacks={'Button1': open_sysmonitor},
                update_interval=10
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ DF
            widget.DF(
                foreground=PRIMARY,
                format=' {uf}{m}',
                partition="/",
                visible_on_warn=False,
                warn_color='FF0000',
                warn_space=20,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ PACKAGES
            widget.TextBox(
                fmt='',
                foreground=PRIMARY,
                fontsize=20,
                margin=15,
                mouse_callbacks={'Button1': open_pacman},
                padding=widget_padding,
            ),
            widget.CheckUpdates(
                colour_have_updates=PRIMARY,
                colour_no_updates=PRIMARY,
                display_format='{updates}',
                distro='Arch',
                foreground=PRIMARY,
                initial_text='Checking updates...',
                no_update_string='0',
                update_interval=3600,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ CLOCK
            widget.Clock(
                format='%I:%M %p',
                foreground=PRIMARY,
                padding=widget_padding,
                update_interval=60,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ BATTERY
            widget.Battery(
                battery=0,
                charge_char='󰚥',
                discharge_char='󱐋',
                format='{char} {percent:2.0%}',
                foreground=PRIMARY,
                full_char = '󰁹',
                low_percentage=0.2,
                low_foregound=battery_low,
                not_charging_char='󰁹',
                padding=widget_padding,
                show_short_text=False,
                update_interval=60,
                hide_threshold=0.9,
            ),
            # }}}

            ],
            20,
            background='#000000',
            border_color=[border_top, border_right, border_bottom, border_left],
            border_width=[0, 0, 0, 0],
            margin=[0, 0, 0, 0],
            opacity=0.9,
        ),
    ),
    # }}}

    # {{{ SCREEN-3
    Screen(
        top=bar.Bar([

            # {{{ Groups
            widget.GroupBox(
                active=PRIMARY,
                background=None,
                borderwidth=3,
                center_aligned=True,
                disable_drag=True,
                fontshadow=None,
                fontsize=font_size,
                hide_unused=False,
                highlight_color=[highlight_color_1, INACTIVE],
                highlight_method='line',
                inactive=inactive,
                margin_x=0,
                margin_y=5,
                padding_x=5,
                rounded=False,
                this_current_screen_border=PRIMARY,
                this_screen_border=PRIMARY,
                urgent_border='FF0000',
                urgent_text='FF0000',
            ),
            # }}}

            # {{{ Windown Name
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
            # }}}

            # {{{ Settings
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                fontsize=20,
                text_closed='󰄽',
                text_open='󰄾',
                widgets=[
                    # {{{ Weather
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[  Weather ]',
                        text_open='[  Weather ]',
                        widgets=[
                            widget.OpenWeather(
                                location='Budapest',
                                format='{location_city} {main_temp}°{units_temperature} - {weather_details} {icon}',
                                foreground=PRIMARY,
                                update_interval=600
                            ),
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                        ]
                    ),
                    # }}}

                    # Network {{{
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[  Network ]',
                        text_open='[  Network ]',
                        widgets=[
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),

                            # {{{ Interface
                            widget.TextBox(
                                fmt='󱫋',
                                fontsize=20,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.GenPollText(
                                func=network_interface,
                                foreground=PRIMARY,
                                update_interval=600,
                            ),
                            # }}}

                            # {{{ IP
                            widget.TextBox(
                                fmt='󰩟',
                                fontsize=20,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.GenPollText(
                                func=network_ip,
                                foreground=PRIMARY,
                                update_interval=600,
                            ),
                            # }}}

                            # {{{ Wlan
                            widget.TextBox(
                                fmt='󰖩',
                                fontsize=20,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.Wlan(
                                foreground=PRIMARY,
                                format='{essid} ({percent:2.0%})',
                                interface='wlp1s0',
                                update_interval=60,
                            ),
                            # }}}

                            # {{{ Gateway
                            widget.TextBox(
                                fmt='󱇢',
                                fontsize=20,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.GenPollText(
                                func=network_gateway,
                                foreground=PRIMARY,
                                update_interval=600,
                            ),
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                            # }}}

                        ]
                    ),
                    # }}}

                    # {{{ XBacklight
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[ 󰌵 Xlight ]',
                        text_open='[ 󰌵 Xlight ]',
                        widgets=[
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': backlight_increase},
                            ),
                            widget.TextBox(
                                fontsize=20,
                                foreground=PRIMARY,
                                fmt='  ',
                                mouse_callbacks={'Button1': backlight_decrease},
                            ),
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                        ]
                    ),
                    ### }}}

                    # {{{ Audio
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[  Audio ]',
                        text_open='[  Audio ]',
                        widgets=[
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_mute},
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_increase},
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_decrease},
                            ),
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                        ]
                    ),
                    widget.Sep(
                        foreground=inactive,
                        linewidth=sep_width,
                        padding=sep_padding,
                    ),
                    # }}}
                ]
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ NETWORK
            widget.Net(
                format='{down:.0f}{down_suffix}  {up:.0f}{up_suffix}',
                foreground=PRIMARY,
                update_interval=10,
                use_bits=True,
                ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ CPU
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=20,
                fmt='',
                padding=widget_padding,
            ),
            widget.CPU(
                format='{load_percent}% ',
                foreground=PRIMARY,
                mouse_callbacks={'Button1': open_sysmonitor},
                update_interval=10,
            ),
            widget.ThermalSensor(
                foreground=PRIMARY,
                format=' {temp:.0f}',
                tag_sensor='CPU',
                threshold=80,
                update_interval=30,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ RAM
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=20,
                fmt='',
                padding=widget_padding,
            ),
            widget.Memory(
                format='{MemUsed:.0f}{mm}',
                foreground=PRIMARY,
                measure_mem = 'G',
                mouse_callbacks={'Button1': open_sysmonitor},
                update_interval=10
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ DF
            widget.DF(
                foreground=PRIMARY,
                format=' {uf}{m}',
                partition="/",
                visible_on_warn=False,
                warn_color='FF0000',
                warn_space=20,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ PACKAGES
            widget.TextBox(
                fmt='',
                foreground=PRIMARY,
                fontsize=20,
                margin=15,
                mouse_callbacks={'Button1': open_pacman},
                padding=widget_padding,
            ),
            widget.CheckUpdates(
                colour_have_updates=PRIMARY,
                colour_no_updates=PRIMARY,
                display_format='{updates}',
                distro='Arch',
                foreground=PRIMARY,
                initial_text='Checking updates...',
                no_update_string='0',
                update_interval=3600,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            # {{{ CLOCK
            widget.Clock(
                format='%I:%M %p',
                foreground=PRIMARY,
                padding=widget_padding,
                update_interval=60,
            ),
            # }}}

            # {{{ BATTERY
            widget.Battery(
                battery=0,
                charge_char='󰚥',
                discharge_char='󱐋',
                format='{char} {percent:2.0%}',
                foreground=PRIMARY,
                full_char = '󰁹',
                low_percentage=0.2,
                low_foregound=battery_low,
                not_charging_char='󰁹',
                padding=widget_padding,
                show_short_text=False,
                update_interval=60,
                hide_threshold=0.9,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            # }}}

            ],
            20,
            background='#000000',
            border_color=[border_top, border_right, border_bottom, border_left],
            border_width=[0, 0, 0, 0],
            margin=[0, 0, 0, 0],
            opacity=0.9,
        ),
    ),
    # }}}

]
