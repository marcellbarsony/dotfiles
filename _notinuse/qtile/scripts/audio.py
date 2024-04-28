import subprocess

def audio_increase():
    cmd = 'wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 10%+'
    try:
        subprocess.run(cmd, shell=True)
    except Exception as err:
        print(f"[-] wpctl volume {err}")

def audio_decrease():
    cmd = 'wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 10%-'
    try:
        subprocess.run(cmd, shell=True)
    except Exception as err:
        print(f"[-] wpctl volume {err}")

def audio_mute():
    cmd = 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'
    try:
        subprocess.run(cmd, shell=True)
    except Exception as err:
        print(f"[-] wpctl volume {err}")
