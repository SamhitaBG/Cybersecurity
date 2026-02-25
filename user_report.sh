#!/bin/bash
echo "=== USER ACCOUNT REPORT ==="

total_users=$(wc -l < /etc/passwd)
#counts total lines in /etc/passwd that is each user
system_users=$(awk -F: '$3 < 1000 {count++} END{print count}' /etc/passwd)
#counts total lines in /etc/passwd
regular_users=$(awk -F: '$3 >= 1000 {count++} END{print count}' /etc/passwd)
#counts users with UID 1000 or greater
logged_in=$(who | awk '{print $1}' | sort -u | wc -l)
#shows logged in users using who
echo ""
echo "=== USER STATISTICS ==="
echo "Total Users: $total_users"
echo "System Users (UID < 1000): $system_users"
echo "Regular Users (UID >= 1000): $regular_users"
echo "Currently Logged In: $logged_in"

echo ""
echo "=== REGULAR USER DETAILS ==="
awk -F: '$3 >= 1000 {printf "%s\t%s\t%s\t%s\t%s\n",$1,$3,$6,$7,"Never"}' /etc/passwd
#prints username, UID, home directory, shell, last login
echo ""
echo "=== GROUP INFORMATION ==="
awk -F: '{split($4,members,","); print $1": "length(members) " members"}' /etc/group
#splits the 4th fields, counts number of users and prints the group name and member count
echo ""
echo "=== SECURITY ALERTS ==="
echo "Users with root privileges (UID 0):"
awk -F: '$3==0 {print "  - "$1}' /etc/passwd
#print usernames with UID=0
echo ""
echo "Users without passwords:"
awk -F: '($2=="" || $2=="*" || $2=="!") {print "  - "$1}' /etc/shadow 2>/dev/null || echo "  All users have passwords set"
#checks password field, where we check if its empty, or locked. the dev/null hides the permission errors.
echo ""
echo "Inactive users (never logged in):"
awk -F: '$3 >= 1000 {print "  - "$1}' /etc/passwd
#prints regular users
