import subprocess

def network_ip():
    cmd = "ip addr"
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    output = result.stdout
    for line in output.split("\n"):
        if "inet " in line:
            ip_address = line.split()[1]
            if ip_address != "127.0.0.1/8":
                return ip_address

def network_interface():
    cmd = "ip addr"
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    output = result.stdout
    for line in output.split("\n"):
        if "state UP" in line:
            interface = line.split(":")[1].strip()
            return interface

def network_gateway():
    cmd = "ip route"
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    output = result.stdout
    for line in output.split("\n"):
        if "default via" in line:
            gateway = line.split()[2]
            return gateway
