#!/bin/bash
echo "===AUTOMATED BACKUP SCRIPT==="
read -p "Enter the directory to backup: " source
if [ ! -d "$source" ]; then
	echo "Source file does not exist"
	exit 1
fi
#throws an error is source directory does not exist
read -p "Enter backup destination: " dest
if [ ! -d "$dest" ]; then
	mkdir -p "$dest"
fi
#if the destination directory does not exist, it creates one
echo "1. Simple Copy"
echo "2. Compressed Archive"
read -p "Enter choice: " choice

echo "[*] Starting backup.."
echo "[*] Source: $source"
echo "[*] Destination: $dest"

times=$(date +%Y%m%d_%H%M%S)
b_name="backup_$times"
#creates a backup name with the required constraints
start=$(date +%s)
#records start time in seconds
case $choice in
	1)
		echo "You've selected Simple Copy"
		cp -r "$source" "$dest/$b_name"
		#copies recursively from source to destination 
		du -sh "$dest/$b_name" 
		#shows size of backup
		;;
	2)
		echo "You've selected Compressed Archive"
		echo "[*] Creating compressed archive.."
		tar -czf "$dest/$b_name.tar.gz" "$source"
		#creates a compressed tar archive where c is create, z is compress and f is filename
		du -sh "$dest/$b_name.tar.gz"
		#shows size of archive
		;;
esac
end=$(date +%s)
dur=$((end-start))
#calculates the ending time in seconds and the duration by calculating the difference between the start and end
echo "Time taken: $dur seconds"

if [ -e "$dest/$b_name" ] || [ -e "$dest/$b_name.tar.gz" ]; then
    echo "Backup successful."
else
    echo "Backup failed."
fi
#checks if the backup was successful by  checking if the  fie or folder exists (-e). if not it throws an error
echo "Removing old backups"
ls -t "$dest" | tail -n +6 | while read file
do
    rm -rf "$dest/$file"
done
#ls -t  sorts by newest first, and tail -n +6 selects everything after the 5th file, and rm deletes them, keeping only the new 5 files in storage.
echo "Backup: $b_name | Date: $(date) | Duration: $dur sec" >> backup.log
#appends backup details to backup.log
echo "Backup completed successfully" | mail -s "Backup Status" samhitabg3006@gmail.com
#sends email notifications with backup status to the given email id.
