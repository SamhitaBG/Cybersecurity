Network Scanning Automation

Project Overview
This project is part of a cybersecurity assignment focused on automating basic network scanning tools using Python. The aim is to understand how Ping, ARP, and Nmap work and how they can be executed programmatically using the subprocess module.

Tools Used
Python 3
Ping (built-in system tool)
ARP (built-in system tool)
Nmap

Installation

Check Python
Run: python3 --version

Install Nmap

Linux (Kali/Ubuntu):
sudo apt-get install nmap

Windows:
Download from https://nmap.org/download.html

Mac:
brew install nmap

Project Structure

network-scanning-tools/
ping_scanner.py
arp_scanner.py
nmap_scanner.py
README.md
screenshots/
ping_output.png
arp_output.png
nmap_output.png

How to Run

Ping Scanner
Run: python3 ping_scanner.py
This program allows scanning a single host or multiple hosts. It checks whether the host is reachable and extracts the average response time from the output.

ARP Scanner
Run: python3 arp_scanner.py
This program retrieves the system ARP table, extracts IP and MAC address mappings, displays them in a formatted table, and shows the total number of entries. It also provides an option to save the results to a file.

Nmap Scanner
Run: python3 nmap_scanner.py
This program checks if Nmap is installed and allows the user to perform different types of scans such as host discovery, port scanning, service version detection, OS detection, and custom port range scans. It displays the results and provides an option to save them to a file.

Example Outputs

Ping Scanner
Host: google.com
Status: Reachable
Average Time: 15 ms

ARP Scanner
IP Address MAC Address
192.168.1.1 AA:BB:CC:DD:EE:FF
192.168.1.10 11:22:33:44:55:66
Total entries: 2

Nmap Scanner
PORT STATE SERVICE
22/tcp open ssh
80/tcp open http
443/tcp open https


