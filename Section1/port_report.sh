#!/bin/bash
if [ "$1" == "" ]; then
	echo "Usage: ./port_report.sh <ip>"
	exit
fi

ip=$1
file="scan_${ip}_$(date +%Y-%m-%d).txt"
nmap -p 21,22,80,443,3306 $ip >$file
open=$(grep -c open $file)
echo "Saved in $file"
echo "Total open ports: $open"
 
