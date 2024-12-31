#!/usr/bin/env python3

import subprocess
import sys


PLAY = "PLAY/PAUSE"
NEXT = "NEXT"
PREV = "PREVIOUS"


def main():
    cmd = f"rofi -dmenu"
    stdin = f"{PLAY}\n{NEXT}\n{PREV}"
    try:
        out = subprocess.run(cmd, shell=True, check=True, input=stdin.encode(), stdout=subprocess.PIPE)
    except subprocess.CalledProcessError as err:
        print(":: [-] ::", err)
        sys.exit(1)
    else:
        return out.stdout.decode().strip()

def execute(select):
    if select == "NEXT":
        cmd = "playerctl next"
        subprocess.run(cmd, shell=True, check=True, stdout=subprocess.PIPE)
    elif select == "PREVIOUS":
        cmd = "playerctl previous"
        subprocess.run(cmd, shell=True, check=True, stdout=subprocess.PIPE)
    elif select == "PLAY/PAUSE":
        cmd = "playerctl play-pause"
        subprocess.run(cmd, shell=True, check=True, stdout=subprocess.PIPE)
    else:
        print(":: [-] :: Unknown command")
        sys.exit(1)


if __name__ == "__main__":
    select = main()
    execute(select)
    sys.exit(0)
