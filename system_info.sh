#!/bin/bash
#tells the OS to use bash for running this script
Username=$(whoami)
#stores current username
hostname=$(hostname)
#stores hostname of machine
dates=$(date "+%Y-%m-%d %H:%M:%S")
#stores date and time 
os=$(uname -s)
#stores OS name
dir=$(basename "$PWD")
#stores current folder name
home=$HOME
#path to home directory
no=$(who | wc -l)
#no of users logged in. wc -l is wod count of the lines
up=$(uptime -p)
#uptime in human readble form

printf "╔════════════════════════════════════════╗\n"
printf "║ %-38s ║\n" "SYSTEM INFORMATION DISPLAY"
printf "║ %-15s : %-19s ║\n" "Username" "$Username"
printf "║ %-15s : %-19s ║\n" "Hostname" "$hostname"
printf "║ %-15s : %-19s ║\n" "Date & Time" "$dates"
printf "║ %-15s : %-19s ║\n" "OS" "$os"
printf "║ %-15s : %-19s ║\n" "Current Dir" "$dir"
printf "║ %-15s : %-19s ║\n" "Home Dir" "$home"
printf "║ %-15s : %-19s ║\n" "Users Online" "$no"
printf "║ %-15s : %-19s ║\n" "Uptime" "$up"
printf "╚════════════════════════════════════════╝\n"
#displays the information. %-15s etc left aligns with 15 characters.

