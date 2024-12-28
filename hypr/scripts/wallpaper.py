#!/usr/bin/env python3

import getpass
import os
import random
import sys

USER = getpass.getuser()
BACKGROUNDS = f"/home/{USER}/Downloads/backgrounds"

def get_random_file():
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



if __name__ == "__main__":
    random_file = get_random_file()

    path = f"/home/{USER}/.cache/wallpaper"
    file = "cache.txt"
    cache_path = os.path.join(path, file)
    cache(cache_path, file)

    add_to_file(file, cache_path)
