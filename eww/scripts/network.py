#!/usr/bin/env python3
"""
Author: Name
Date  : 05/05/24
Desc  : Description
"""

import subprocess
import argparse

def network_ip():
    cmd = "ip addr"
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    output = result.stdout
    for line in output.split("\n"):
        if "inet " in line:
            ip_address = line.split()[1]
            if ip_address != "127.0.0.1/8":
                print(ip_address)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Process arguments for interface or network mode")

    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--interface", action="store_true", help="Interface")
    group.add_argument("--ip", action="store_true", help="IP")
    group.add_argument("--gateway", action="store_true", help="Gateway")

    args = parser.parse_args()

    if args.interface:
        network_ip()
    else:
        print(":: Argument parsing failed")
