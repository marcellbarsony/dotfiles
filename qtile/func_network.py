import subprocess


def network_ip():
    cmd = 'ip addr'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    output = result.stdout
    for line in output.split('\n'):
        if 'inet ' in line:
            ip_address = line.split()[1].split('/')[0]
            if ip_address != '127.0.0.1':
                ip_address = f'[{ip_address}]'
                return ip_address

def network_interface():
    cmd = 'ip addr'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    output = result.stdout
    for line in output.split('\n'):
        if 'state UP' in line:
            interface = line.split(':')[1].strip()
            interface = f'[{interface}]'
            return interface
