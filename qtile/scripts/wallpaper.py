import os
import random
import subprocess
from libqtile import qtile


def random_wallpaper():
    path = f"/home/{os.getlogin()}/tmp/backgrounds"
    files = []
    for root, _, filenames in os.walk(path):
        if "mobile" in root or "windows" in root:
            continue
        for filename in filenames:
            files.append(os.path.join(root, filename))
    file = random.choice(files)
    return file

def pywal(file):
    cmd = f"wal -i {file}"
    try:
        subprocess.run(cmd, shell=True, check=True)
    except Exception:
        pass

def setwall():
    # wallpaper = random_wallpaper()
    file = "/home/marci/tmp/backgrounds/2k/cyberpunk/cyberpunk-city-001.png"
    for screen in qtile.screens:
        screen.cmd_set_wallpaper(file, 'stretch')
