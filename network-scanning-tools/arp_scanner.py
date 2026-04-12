#!/usr/bin/env python3

import subprocess
import re

def get_arp():
    # run arp command to get table
    # works on most systems with -a
    cmd = ["arp", "-a"]

    res = subprocess.run(
        cmd,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )

    return res.stdout  # return raw arp output


def parse(out):
    # extract IP and MAC using regex
    # pattern:
    # IP → 192.168.x.x
    # MAC → XX:XX:XX:XX:XX:XX
    pat = r'(\d+\.\d+\.\d+\.\d+)[^\n]*?([0-9a-fA-F:-]{17})'

    return re.findall(pat, out)


def show(data):
    # display results in table format
    print("\nIP Address\t\tMAC Address")
    print("---------------------------------------")

    for ip, mac in data:
        print(f"{ip}\t\t{mac}")

    print("\nTotal entries:", len(data))


def save(data):
    # save results to file
    with open("arp_results.txt", "w") as f:
        for ip, mac in data:
            f.write(f"{ip} {mac}\n")

    print("saved to arp_results.txt")


if __name__ == "__main__":
    print("=== ARP Scanner ===")
    print("Scanning ARP table...")

    # step 1: get raw arp output
    out = get_arp()

    # step 2: parse it into usable data
    data = parse(out)

    # step 3: display nicely
    show(data)

    # optional: save results
    ch = input("\nSave results to file? (y/n): ")
    if ch.lower() == "y":
        save(data)
