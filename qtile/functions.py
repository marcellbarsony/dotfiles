# Lazy objects
# https://qtile.readthedocs.io/en/stable/manual/config/lazy.html

import subprocess


# Keys
def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)


def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)


def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)


def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)


def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)


# Screens
def network_ip():
    cmd = 'ip addr'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    output = result.stdout
    for line in output.split('\n'):
        if 'inet ' in line:
            ip_address = line.split()[1].split('/')[0]
            if ip_address != '127.0.0.1':
                return ip_address


def network_interface():
    cmd = 'ip addr'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    output = result.stdout
    for line in output.split('\n'):
        if 'state UP' in line:
            interface = line.split(':')[1].strip()
            return interface


def window_name(text):
    for string in [" - Chromium", " - Firefox"]:
        text = text.replace(string, "")
        return text
