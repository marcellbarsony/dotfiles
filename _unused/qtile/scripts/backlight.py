import subprocess

def backlight_increase():
    cmd = 'brightnessctl --class=backlight set +10%'
    subprocess.run(cmd, shell=True, stdout=subprocess.PIPE, text=True)

def backlight_decrease():
    cmd = 'brightnessctl --class=backlight set 10%-'
    subprocess.run(cmd, shell=True, stdout=subprocess.PIPE, text=True)
