# https://qtile.readthedocs.io/en/stable/manual/config/screens.html

from libqtile import bar, widget
from libqtile.config import Screen
from colors import *
from mouse import *
from func_screens import window_name
from func_audio import audio_increase, audio_decrease, audio_mute
from func_backlight import backlight_increase, backlight_decrease
from func_network import network_ip, network_interface
from variables import font_size, sep_padding, sep_width


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
                highlight_color=['000000', '4A2996'],
                highlight_method='line',
                inactive=INACTIVE,
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

            widget.Spacer(),

            ### Additional ###
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                fontsize=24,
                text_closed='󰄽',
                text_open='󰄾',
                widgets=[
                    ### UPDATES ###
                    widget.TextBox(
                        foreground=PRIMARY,
                        fontsize=20,
                        padding=3,
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
                        no_update_string='',
                        update_interval=3600,
                    ),
                    widget.Sep(
                        foreground=INACTIVE,
                        linewidth=sep_width,
                        padding=sep_padding,
                    ),
                    ### Weather ###
                    widget.OpenWeather(
                        location='Budapest',
                        format='{location_city} {main_temp}°{units_temperature} - {weather_details} {icon}',
                        foreground=PRIMARY,
                        update_interval=600
                    ),
                    widget.Sep(
                        foreground=INACTIVE,
                        linewidth=sep_width,
                        padding=sep_padding,
                    ),
                    ### XBacklight ###
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[Xlight]',
                        text_open='[Xlight]',
                        widgets=[
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
                        ]
                    ),
                    ### Audio ###
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[Audio]',
                        text_open='[Audio]',
                        widgets=[
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_mute},
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_decrease},
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_increase},
                            ),
                        ]
                    ),
                    widget.Sep(
                        foreground=INACTIVE,
                        linewidth=sep_width,
                        padding=sep_padding,
                    ),
                ]
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### NETWORK ###
            widget.Net(
                format='{down} ↓↑ {up}',
                foreground=PRIMARY,
                #prefix='M',
                update_interval=5,
                ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### CPU ###
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=23,
                fmt='',
                padding=3,
            ),
            widget.CPU(
                format='{load_percent}%',
                foreground=PRIMARY,
                mouse_callbacks={'Button1': open_sysmonitor},
                update_interval=10,
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### RAM ###
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=23,
                fmt='',
                padding=0,
            ),
            widget.Memory(
                format='{MemUsed:.0f}{mm}',
                foreground=PRIMARY,
                mouse_callbacks={'Button1': open_sysmonitor},
                update_interval=10
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### BATTERY ###
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=23,
                fmt='',
                padding=3,
            ),
            widget.Battery(
                battery=0,
                charge_char='',
                discharge_char='Discharge',
                format='{percent:2.0%}',
                foreground=PRIMARY,
                low_percentage=0.1,
                low_foregound='FF0000',
                update_interval=60,
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### CLOCK ###
            widget.Clock(
                format='%b-%d %I:%M %p',
                foreground=PRIMARY,
                update_interval=60,
            ),
            ],
            26,
            border_width=[0, 0, 0, 0],
            border_color=['000000', '000000', '000000', '000000'],
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
                highlight_color=['000000', '4A2996'],
                highlight_method='line',
                inactive=INACTIVE,
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

            widget.Spacer(),

            ### Additional ###
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                fontsize=24,
                text_closed='󰄽',
                text_open='󰄾',
                widgets=[
                    ### UPDATES ###
                    widget.TextBox(
                        foreground=PRIMARY,
                        fontsize=20,
                        padding=3,
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
                        no_update_string='',
                        update_interval=3600,
                    ),
                    widget.Sep(
                        foreground=INACTIVE,
                        linewidth=sep_width,
                        padding=sep_padding,
                    ),
                    ### Weather ###
                    widget.OpenWeather(
                        location='Budapest',
                        format='{location_city} {main_temp}°{units_temperature} - {weather_details} {icon}',
                        foreground=PRIMARY,
                        update_interval=600
                    ),
                    widget.Sep(
                        foreground=INACTIVE,
                        linewidth=sep_width,
                        padding=sep_padding,
                    ),
                    ### XBacklight ###
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[Xlight]',
                        text_open='[Xlight]',
                        widgets=[
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
                        ]
                    ),
                    ### Audio ###
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[Audio]',
                        text_open='[Audio]',
                        widgets=[
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_mute},
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_decrease},
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_increase},
                            ),
                        ]
                    ),
                    widget.Sep(
                        foreground=INACTIVE,
                        linewidth=sep_width,
                        padding=sep_padding,
                    ),
                ]
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### NETWORK ###
            widget.Net(
                format='{down} ↓↑ {up}',
                foreground=PRIMARY,
                #prefix='M',
                update_interval=5,
                ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### CPU ###
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=23,
                fmt='',
                padding=3,
            ),
            widget.CPU(
                format='{load_percent}%',
                foreground=PRIMARY,
                mouse_callbacks={'Button1': open_sysmonitor},
                update_interval=10,
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### RAM ###
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=23,
                fmt='',
                padding=0,
            ),
            widget.Memory(
                format='{MemUsed:.0f}{mm}',
                foreground=PRIMARY,
                mouse_callbacks={'Button1': open_sysmonitor},
                update_interval=10
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### BATTERY ###
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=23,
                fmt='',
                padding=3,
            ),
            widget.Battery(
                battery=0,
                charge_char='',
                discharge_char='Discharge',
                format='{percent:2.0%}',
                foreground=PRIMARY,
                low_percentage=0.1,
                low_foregound='FF0000',
                update_interval=60,
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### CLOCK ###
            widget.Clock(
                format='%b-%d %I:%M %p',
                foreground=PRIMARY,
                update_interval=60,
            ),
            ],
            26,
            border_width=[0, 0, 0, 0],
            border_color=['000000', '000000', '000000', '000000'],
            background='#16161E',
            margin=[3, 3, 0, 3],
            opacity=0.8,
        ),
    ),
    # SCREEN3
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
                highlight_color=['000000', '4A2996'],
                highlight_method='line',
                inactive=INACTIVE,
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

            widget.Spacer(),

            ### Additional ###
            widget.WidgetBox(
                button_location='left',
                close_button_location='right',
                foreground=PRIMARY,
                fontsize=24,
                text_closed='󰄽',
                text_open='󰄾',
                widgets=[
                    ### UPDATES ###
                    widget.TextBox(
                        foreground=PRIMARY,
                        fontsize=20,
                        padding=3,
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
                        no_update_string='',
                        update_interval=3600,
                    ),
                    widget.Sep(
                        foreground=INACTIVE,
                        linewidth=sep_width,
                        padding=sep_padding,
                    ),
                    ### Weather ###
                    widget.OpenWeather(
                        location='Budapest',
                        format='{location_city} {main_temp}°{units_temperature} - {weather_details} {icon}',
                        foreground=PRIMARY,
                        update_interval=600
                    ),
                    widget.Sep(
                        foreground=INACTIVE,
                        linewidth=sep_width,
                        padding=sep_padding,
                    ),
                    ### XBacklight ###
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[Xlight]',
                        text_open='[Xlight]',
                        widgets=[
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
                        ]
                    ),
                    ### Audio ###
                    widget.WidgetBox(
                        button_location='left',
                        close_button_location='right',
                        foreground=PRIMARY,
                        text_closed='[Audio]',
                        text_open='[Audio]',
                        widgets=[
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_mute},
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_decrease},
                            ),
                            widget.TextBox(
                                fmt='  ',
                                fontsize=20,
                                foreground=PRIMARY,
                                mouse_callbacks={'Button1': audio_increase},
                            ),
                        ]
                    ),
                    widget.Sep(
                        foreground=INACTIVE,
                        linewidth=sep_width,
                        padding=sep_padding,
                    ),
                ]
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### NETWORK ###
            widget.Net(
                format='{down} ↓↑ {up}',
                foreground=PRIMARY,
                #prefix='M',
                update_interval=5,
                ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### CPU ###
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=23,
                fmt='',
                padding=3,
            ),
            widget.CPU(
                format='{load_percent}%',
                foreground=PRIMARY,
                mouse_callbacks={'Button1': open_sysmonitor},
                update_interval=10,
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### RAM ###
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=23,
                fmt='',
                padding=0,
            ),
            widget.Memory(
                format='{MemUsed:.0f}{mm}',
                foreground=PRIMARY,
                mouse_callbacks={'Button1': open_sysmonitor},
                update_interval=10
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### BATTERY ###
            widget.TextBox(
                foreground=PRIMARY,
                fontsize=23,
                fmt='',
                padding=3,
            ),
            widget.Battery(
                battery=0,
                charge_char='',
                discharge_char='Discharge',
                format='{percent:2.0%}',
                foreground=PRIMARY,
                low_percentage=0.1,
                low_foregound='FF0000',
                update_interval=60,
            ),
            widget.Sep(
                foreground=INACTIVE,
                linewidth=sep_width,
                padding=sep_padding,
            ),
            ### CLOCK ###
            widget.Clock(
                format='%b-%d %I:%M %p',
                foreground=PRIMARY,
                update_interval=60,
            ),
            ],
            26,
            border_width=[0, 0, 0, 0],
            border_color=['000000', '000000', '000000', '000000'],
            background='#16161E',
            margin=[3, 3, 0, 3],
            opacity=0.8,
        ),
    ),
]
