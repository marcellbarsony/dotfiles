#!/usr/bin/env python3

import getpass
import os
import subprocess
import sys
from datetime import datetime


USER = getpass.getuser()
PATH = f"/home/{USER}/Downloads/screenshots"


def check_dir(PATH: str):
    if os.path.exists(PATH):
        pass
    else:
        os.mkdir(PATH)

def capture(file: str):
    cmd = f'grim -g "$(slurp)" "{PATH}/{file}".png'
    try:
        subprocess.run(cmd, shell=True, check=True, stdout=subprocess.DEVNULL)
    except Exception as err:
        print(":: [-] :: Screenshot ::", err)
        sys.exit(1)


if __name__ == "__main__":
    check_dir(PATH)
    file = datetime.now().strftime("%Y%m%d-%H%M%S")
    capture(file)
    sys.exit(0)
