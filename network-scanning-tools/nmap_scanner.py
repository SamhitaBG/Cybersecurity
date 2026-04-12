#!/usr/bin/env python3

import subprocess
import sys

def check_nmap():
    # check if nmap is installed by running version command
    try:
        r = subprocess.run(["nmap", "-V"], stdout=subprocess.PIPE)

        if r.returncode == 0:
            print("Nmap is installed")
            return True

    except:
        pass

    print("Nmap is NOT installed")
    return False


def run_scan(t, ch):
    # decide which scan to run based on user choice

    if ch == "1":
        # ping scan (host discovery only)
        cmd = ["nmap", "-sn", t]

    elif ch == "2":
        # default port scan (1-1000)
        cmd = ["nmap", t]

    elif ch == "3":
        # service version detection
        cmd = ["nmap", "-sV", t]

    elif ch == "4":
        # custom port scan
        p = input("Enter port range (e.g. 20-80): ")
        cmd = ["nmap", "-p", p, t]

    elif ch == "5":
        # OS detection (may need sudo)
        cmd = ["nmap", "-O", t]

    else:
        print("wrong choice")
        return None

    try:
        print("\nScanning... (this may take a while)")

        # run nmap command
        r = subprocess.run(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            timeout=120
        )

        print("Scan completed")
        return r.stdout

    # handle long scans
    except subprocess.TimeoutExpired:
        print("Scan timed out")
        return None


def show(out):
    # display output cleanly
    print("\nResults:")
    print("=" * 40)

    if out:
        print(out)
    else:
        print("No results")

    print("=" * 40)


def save(out):
    # save scan results to file
    with open("nmap_results.txt", "w") as f:
        f.write(out)

    print("saved to nmap_results.txt")


if __name__ == "__main__":

    print("=== Nmap Scanner ===")

    # step 1: check nmap exists
    if not check_nmap():
        sys.exit()

    # step 2: get target from user
    t = input("Enter target IP or network: ")

    print("""
1. Basic Host Discovery (-sn)
2. Port Scan (1-1000)
3. Service Version Detection (-sV)
4. Custom Port Range Scan
5. OS Detection (-O)
""")

    # step 3: choose scan type
    ch = input("Enter choice (1-5): ")

    # step 4: run scan
    out = run_scan(t, ch)

    # step 5: show output
    show(out)

    # step 6: optional save
    if out:
        s = input("\nSave results to file? (y/n): ")
        if s.lower() == "y":
            save(out)
