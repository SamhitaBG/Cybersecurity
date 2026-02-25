#!/bin/bash
read -p "Enter the log file: " log
#User input for log in file
if [ ! -f "$log" ]; then
	echo "Error: File does not exist"
exit 1
fi
if [ ! -s "$log" ]; then
        echo "Error: File is empty"
exit 1
fi
#throws an  error if  file does not exist or if the file contents are empty 
echo "===LOG FILE ANALYSIS==="  
echo "Log File :$log"
echo ""
tot=$(wc -l < "$log")
echo "Total entries: $tot"
echo ""
#Displays only the total entries, not the filename
uniq_i=$(awk '{print $1}' "$log" | sort | uniq)
#extracts the first column(IP address) and sorts them, displaying only the unique results
count=$(echo "$uniq_i" | wc -l)
#counts the unique IP addresses
echo "Unique IP Addresses: $count"
echo "$uniq_i"
echo ""

echo "Status code summary: "
awk '{print $NF}' "$log" | sort | uniq -c | awk '{print " " $2 ": " $1 "requests"}'
echo ""
#extracts the last column (NF), sorts, counts the unique codes, and prints the status codes with their frequency.
echo "Top 3 IP Addresses: "
awk '{print $1}' "$log" | sort | uniq -c | sort -nr | head -3 | awk '{print " " NR ". " $2 "-" $1 "requests"}'
#count occurences of IP, and sorts them in descending order, (NR) and takes top 3.
echo ""

echo "Date range: "
awk -F'[][]' '{print $2}' "$log" | head -1
awk -F'[][]' '{print $2}' "$log" | tail -1
echo ""
#extracts the first and last date, using a field seperator, head and tail

echo "Security threats: "
awk '$NF==403 {print $1}' "$log" | sort | uniq -c
echo ""
#finds out if the status code is 403, and if so sorts it and counts the occurence of the unique code
echo "Generating CSV report: "
awk '{print $1}' "$log" | sort | uniq -c | awk '{print $2 "," $1}' >  report.csv
#generates a CSV file by sorting and putting the unique values in a csv file called report.csv

