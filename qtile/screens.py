# https://qtile.readthedocs.io/en/stable/manual/config/screens.html

from libqtile import bar, widget
from libqtile.config import Screen
from colors import *
from mouse import *
from func_screens import window_name
from func_audio import audio_increase, audio_decrease, audio_mute
from func_backlight import backlight_increase, backlight_decrease
from func_network import network_ip, network_interface
from variables import font_size, sep_padding, sep_width, widget_padding


widget_defaults = dict(
    font="JetBrainsMono Nerd Font Mono",
    fontsize=15,
    padding=0,
)
extension_defaults = widget_defaults.copy()


screens = [

    # SCREEN1
    Screen(
        top=bar.Bar([
            ### Groups ###
            widget.GroupBox(
                active=PRIMARY,
                background=None,
                borderwidth=3,
                center_aligned=True,
                disable_drag=True,
                fontshadow=None,
                fontsize=font_size,
                hide_unused=False,
                highlight_color=[highlight_color_1, '4A2996'],
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
            ### Windown Name ###
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
            ### Spacer ###
            widget.Spacer(),
            ### Settings ###
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                fontsize=24,
                text_closed='󰄽',
                text_open='󰄾',
                widgets=[
                    ### Weather ###
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
                    ### Network ###
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
                            widget.TextBox(
                                fmt='󱫋',
                                fontsize=24,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.GenPollText(
                                func=network_interface,
                                foreground=PRIMARY,
                                update_interval=600,
                            ),
                            ### Wlan ###
                            widget.TextBox(
                                fmt='󰖩',
                                fontsize=24,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.Wlan(
                                foreground=PRIMARY,
                                format='{essid} ({percent:2.0%})',
                                interface='wlp1s0',
                                update_interval=60,
                            ),
                            ### IP ###
                            widget.TextBox(
                                fmt='󰩟',
                                fontsize=24,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.GenPollText(
                                func=network_ip,
                                foreground=PRIMARY,
                                update_interval=600,
                            ),
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                        ]
                    ),
                    ### XBacklight ###
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
                                fontsize=22,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': backlight_increase},
                            ),
                            widget.TextBox(
                                fontsize=22,
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
                    ### Audio ###
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
                                fontsize=22,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_mute},
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=22,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_increase},
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=22,
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
                ]
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### NETWORK ###
            widget.Net(
                format='{down}  {up}',
                foreground=PRIMARY,
                #prefix='M',
                update_interval=5,
                ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### CPU ###
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=24,
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
                format='{temp:.1f}{unit}',
                tag_sensor='CPU',
                threshold=80,
                update_interval=30,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### RAM ###
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=24,
                fmt='',
                padding=widget_padding,
            ),
            widget.Memory(
                format='{MemUsed:.0f}{mm}',
                foreground=PRIMARY,
                mouse_callbacks={'Button1': open_sysmonitor},
                update_interval=10
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### PACKAGES ###
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=22,
                padding=widget_padding,
                margin=15,
                fmt='',
            ),
            widget.CheckUpdates(
                colour_have_updates=PRIMARY,
                colour_no_updates=PRIMARY,
                display_format='{updates}',
                distro='Arch_Sup',
                initial_text='Checking updates...',
                foreground=PRIMARY,
                no_update_string='0',
                update_interval=3600,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### BATTERY ###
            widget.Battery(
                battery=0,
                charge_char='󰚥',
                discharge_char='󱐋',
                format='{char} {percent:2.0%}',
                foreground=PRIMARY,
                full_char = '󰁹',
                low_percentage=0.1,
                low_foregound=battery_low,
                update_interval=60,
                padding=widget_padding,
                show_short_text=False,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### CLOCK ###
            widget.Clock(
                format='%I:%M %p',
                foreground=PRIMARY,
                update_interval=60,
                padding=widget_padding,
            ),
            ],
            26,
            border_width=[0, 0, 0, 0],
            border_color=[border_top, border_right, border_bottom, border_left],
            background='#16161E',
            margin=[3, 3, 0, 3],
            opacity=0.8,
        ),
    ),

    # SCREEN2
    Screen(
        top=bar.Bar([
            ### Groups ###
            widget.GroupBox(
                active=PRIMARY,
                background=None,
                borderwidth=3,
                center_aligned=True,
                disable_drag=True,
                fontshadow=None,
                fontsize=font_size,
                hide_unused=False,
                highlight_color=[highlight_color_1, '4A2996'],
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
            ### Windown Name ###
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
            ### Spacer ###
            widget.Spacer(),
            ### Settings ###
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                fontsize=24,
                text_closed='󰄽',
                text_open='󰄾',
                widgets=[
                    ### Weather ###
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
                    ### Network ###
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
                            widget.TextBox(
                                fmt='󱫋',
                                fontsize=24,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.GenPollText(
                                func=network_interface,
                                foreground=PRIMARY,
                                update_interval=600,
                            ),
                            ### Wlan ###
                            widget.TextBox(
                                fmt='󰖩',
                                fontsize=24,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.Wlan(
                                foreground=PRIMARY,
                                format='{essid} ({percent:2.0%})',
                                interface='wlp1s0',
                                update_interval=60,
                            ),
                            ### IP ###
                            widget.TextBox(
                                fmt='󰩟',
                                fontsize=24,
                                foreground=PRIMARY,
                                padding=sep_padding,
                            ),
                            widget.GenPollText(
                                func=network_ip,
                                foreground=PRIMARY,
                                update_interval=600,
                            ),
                            widget.Sep(
                                foreground=inactive,
                                linewidth=sep_width,
                                padding=sep_padding,
                            ),
                        ]
                    ),
                    ### XBacklight ###
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
                                fontsize=22,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': backlight_increase},
                            ),
                            widget.TextBox(
                                fontsize=22,
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
                    ### Audio ###
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
                                fontsize=22,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_mute},
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=22,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_increase},
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=22,
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
                ]
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### NETWORK ###
            widget.Net(
                format='{down}  {up}',
                foreground=PRIMARY,
                #prefix='M',
                update_interval=5,
                ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### CPU ###
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=24,
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
                format='{temp:.1f}{unit}',
                tag_sensor='CPU',
                threshold=80,
                update_interval=30,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### RAM ###
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=24,
                fmt='',
                padding=widget_padding,
            ),
            widget.Memory(
                format='{MemUsed:.0f}{mm}',
                foreground=PRIMARY,
                mouse_callbacks={'Button1': open_sysmonitor},
                update_interval=10
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### PACKAGES ###
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=22,
                padding=widget_padding,
                margin=15,
                fmt='',
            ),
            widget.CheckUpdates(
                colour_have_updates=PRIMARY,
                colour_no_updates=PRIMARY,
                display_format='{updates}',
                distro='Arch_Sup',
                initial_text='Checking updates...',
                foreground=PRIMARY,
                no_update_string='0',
                update_interval=3600,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### BATTERY ###
            widget.Battery(
                battery=0,
                charge_char='󰚥',
                discharge_char='󱐋',
                format='{char} {percent:2.0%}',
                foreground=PRIMARY,
                full_char = '󰁹',
                low_percentage=0.1,
                low_foregound=battery_low,
                update_interval=60,
                padding=widget_padding,
                show_short_text=False,
            ),
            widget.Sep(
                foreground=inactive,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### CLOCK ###
            widget.Clock(
                format='%I:%M %p',
                foreground=PRIMARY,
                update_interval=60,
                padding=widget_padding,
            ),
            ],
            26,
            border_width=[0, 0, 0, 0],
            border_color=[border_top, border_right, border_bottom, border_left],
            background='#16161E',
            margin=[3, 3, 0, 3],
            opacity=0.8,
        ),
    ),

]
