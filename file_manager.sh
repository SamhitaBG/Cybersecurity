#!/bin/bash
while true
do
#infinite loop so that the user sees the menu everytime, until the exit option is chosen.
printf "\nFILE & DIRECTORY MANAGER\n\
1. List files in current directory\n\
2. Create a new directory\n\
3. Create a new file\n\
4. Delete a file\n\
5. Rename a file\n\
6. Search for a file\n\
7. Count files and directories\n\
8. View file permissions\n\
9. Copy a file\n\
10. Exit\n"
#prints menu options
read -p "Enter your choice" choice
case $choice in
#used to let the user choose a case/choice
1)
echo "Option 1 selected"
ls -lh
#lists all files in directory in detail.
echo "Files listed"
;;
2)
echo "Option 2 selected"
read -p "Enter name of directory" directory
if [ -d "$directory" ]; then
echo "Directory exists"
fi
mkdir "$directory"
#creates a new directory with given name
;;
3)
echo "Option 3 selected"
read -p "Enter name of file" file
if [ -f "$file" ]; then
echo "File exists"
fi
touch "$file"
#creates a new file with the given file
;;
4)
echo "Option 4 selected"
read -p "Enter name of file to be deleted" delfile
if [ -f "$delfile" ]; then
rm "$delfile"
echo "Deleted file $delfile"
else
echo "File does not exist"
fi
#deletes the file,name given by the user, and returns an error if it does not exist
;;
5)
echo "Option 5 selected"
read -p "Enter the old name" oldn
read -p "Enter the new name" newn
if [ -f "$oldn" ]; then
mv "$oldn" "$newn"
echo "File renamed successfully"
else
echo "File does not exist"
fi
#renames the file, and returns an error if it does not exist.
;;
6)
echo "Option 6 selected"
read -p "Enter name of file to be searched" serfile
if [ -f "$serfile" ]; then
find . -name "$serfile"
else
echo "File does not exist"
fi
#searches for a file, using find, and returns an error if the file is not found
;;
7)
echo "Option 7 selected"
fcount=$(find . -type f | wc -l)
dcount=$(find . -type d | wc -l)
echo "File count:$fcount"
echo "Directory count:$dcount"
#counts the number of files and directories using find, and returns the count.
;;
8)
echo "Option 8 selected"
read -p "Enter filename" fperm
if [ -f "$fperm" ]; then
ls -l "$fperm"
else
echo "File does not exist"
fi
#displays the file permission, and returns an error if file does not exist.
;;
9)
echo "Option 9 selected"
read -p "Enter source file" source
read -p "Enter destination file" dest
if [ -f "$source" ]; then
cp "$source" "$dest"
if [ $? -eq 0 ]; then
echo "File Copied"
else
echo "Error: File could not be copied"
fi
else
echo "Error: Source file does not exist"
fi
#copies the file contents from source to destination, and throws an error is source file doesn't exist.
;;
10)
echo "Exiting program.."
break
#exits the program
;;
*)
echo "Invalid option"
#if any other option is chosen, then it's invalid.
;;
esac
echo ""
done



