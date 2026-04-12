#!/usr/bin/env python3

import subprocess
import platform
import re

def ping_host(h):
    # decide which ping command to use based on OS
    # windows uses -n, linux/mac uses -c
    if platform.system().lower() == "windows":
        cmd = ["ping", "-n", "4", h]
    else:
        cmd = ["ping", "-c", "4", h]

    try:
        # run the ping command
        # capture output so we can analyze it
        res = subprocess.run(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            timeout=10
        )

        out = res.stdout  # full output of ping

        # check if host is reachable
        # different OS print slightly different messages
        if "bytes from" in out or "Reply from" in out:
            st = "Reachable"
        else:
            st = "Unreachable"

        # default value if we can't find avg time
        avg = "N/A"

        # extract avg time using regex
        # windows format → "Average = 15ms"
        m1 = re.search(r'Average = (\d+)ms', out)

        # linux/mac format → min/avg/max
        m2 = re.search(r'=\s*[\d\.]+/([\d\.]+)/', out)

        if m1:
            avg = m1.group(1) + " ms"
        elif m2:
            avg = m2.group(1) + " ms"

        return st, avg

    # if ping takes too long, stop it
    except subprocess.TimeoutExpired:
        return "Timeout", "N/A"


def main():
    print("=== Ping Scanner ===")

    # ask user if they want single or multiple hosts
    ch = input("Ping single host? (y/n): ").lower()

    if ch == "y":
        hs = [input("Enter hostname or IP: ")]
    else:
        # split multiple inputs by comma
        hs = input("Enter multiple hosts (comma separated): ").split(",")

    # loop through each host and scan
    for h in hs:
        h = h.strip()  # remove extra spaces
        st, avg = ping_host(h)

        # print results clearly
        print("\nHost:", h)
        print("Status:", st)
        print("Average Time:", avg)


# standard python entry point
if __name__ == "__main__":
    main()
