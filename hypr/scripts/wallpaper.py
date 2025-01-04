#!/usr/bin/env python3

import getpass
import os
import random
import subprocess
import sys


USER = getpass.getuser()
BACKGROUNDS = f"/home/{USER}/Downloads/backgrounds"


# Random Background {{{
def random_background():
    all_files = []
    for root, _, files in os.walk(BACKGROUNDS):
        for file in files:
            all_files.append(os.path.join(root, file))

    # Choose a random file if the list is not empty
    if all_files:
        return random.choice(all_files)
    else:
        print(":: [-] :: No files were found")
        return None
# }}}

# Random Transition {{{
def random_transition() -> str:
    transitions = ["simple", "any", "wipe", "outer", "grow", "random"]
    transition = random.choice(transitions)
    return transition
# }}}

# Background {{{
def set_background(background: str, transition: str):
    cmd = f"swww img {background} " \
        f"--transition-angle=45 " \
        f"--transition-bezier .43,0.19,1,.4 " \
        f"--transition-duration=2 " \
        f"--transition-fps=60 " \
        f"--transition-type={transition}"
    try:
        subprocess.run(cmd, shell=True, check=True, stdout=subprocess.PIPE)
    except subprocess.CalledProcessError as err:
        print(":: [-] :: Background ::", err)
        sys.exit(1)
# }}}

# Color scheme {{{
def color_scheme(background: str):
    cmd = f"matugen image {background}"
    try:
        subprocess.run(cmd, shell=True, check=True, stdout=subprocess.PIPE)
    except subprocess.CalledProcessError as err:
        print(":: [-] :: Color scheme ::", err)
        sys.exit(1)
# }}}

# Cache {{{
def cache(path: str, file: str):
    if os.path.exists(path):
        print(":: [i] :: Directory already exists")
        pass
    else:
        os.mkdir(path)
        print(":: [+] :: Created directory")

    if not os.path.exists(file):
        with open(file, "w") as f:
            f.write("")
        print(f"File created: {file}")
    else:
        print(f"File already exists: {file}")

def add_to_file(file, cache):
        with open(cache, "a") as c:
            c.write(file)
# }}}


if __name__ == "__main__":
    background = random_background()

    if background is None:
        print(":: [-] :: No backgrounds were found")
        sys.exit(1)

    transition = random_transition()
    set_background(background, transition)
    color_scheme(background)

    # Cache {{{
    cache_dir = f"/home/{USER}/.cache/backgrounds"
    cache_file = "cache.txt"
    cache_path = os.path.join(cache_dir, cache_file)
    cache(cache_path, cache_file)

    add_to_file(background, cache_path)
    # }}}
