import subprocess

def audio_increase():
    cmd = 'wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 10%+'
    subprocess.run(cmd, shell=True)

def audio_decrease():
    cmd = 'wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 10%-'
    subprocess.run(cmd, shell=True)

def audio_mute():
    cmd = 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'
    subprocess.run(cmd, shell=True)
