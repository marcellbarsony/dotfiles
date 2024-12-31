#!/usr/bin/env python3

import subprocess
import sys


LOCK = "Hyprlock"
REBOOT = "Reboot"
LOGOUT = "Log out"
SHUTDOWN = "Poweroff"


def main():
    cmd = f"rofi -dmenu"
    stdin = f"{LOCK}\n{SHUTDOWN}\n{REBOOT}\n{LOGOUT}"
    try:
        out = subprocess.run(cmd, shell=True, check=True, input=stdin.encode(), stdout=subprocess.PIPE)
    except subprocess.CalledProcessError as err:
        print(":: [-] ::", err)
        sys.exit(1)
    else:
        return out.stdout.decode().strip()

def execute(select):
    if select == "Hyprlock":
        cmd = "hyprlock"
        subprocess.run(cmd, shell=True, check=True, stdout=subprocess.PIPE)
    elif select == "Reboot":
        cmd = "reboot"
        subprocess.run(cmd, shell=True, check=True, stdout=subprocess.PIPE)
    elif select == "SHUTDOWN":
        cmd = "poweroff"
        subprocess.run(cmd, shell=True, check=True, stdout=subprocess.PIPE)
    elif select == "LOGOUT":
        cmd = "hyprctl dispatch exit"
        subprocess.run(cmd, shell=True, check=True, stdout=subprocess.PIPE)
    else:
        print(":: [-] :: Unknown command")
        sys.exit(1)


if __name__ == "__main__":
    select = main()
    execute(select)
    sys.exit(0)
