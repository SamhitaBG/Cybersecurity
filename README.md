Samhita BG
I attempted all 5 questions: System Information Display, File and Directory Manager, Log File Analyzer, Automated Backup Script, User Account Reporter 
How to run:
./system_info.sh
./file_manager.sh
./loganalyzer.sh
./backup.sh
./user_report.sh

Sample Test cases:
-For File and Directory Manager:
  list the files
  Create new directory and file and throw error if file already exists
  delete a file and throw error if file doesn't exist
  rename a file and throw error if file doesn't exist
  search a file and throw error if file doesn't exist
  count files and directories
  file permission viewer option, and throw error if file doesn't exist
  File copy option and throw error is source file doesn't exist.
-For Log File Analyzer:
  Accept log filename as argument 
  Display total number of log entries  
  Count and display unique IP addresses 
  Count status codes (200, 404, 403, etc.) 
  Find most frequently accessed page 
  List top 3 IP addresses by number of requests 
  Data range analysis
  Detect security threats(403)
  generate csv report
-For Automated Backup Script:
  Source Selection: Ask user which directory to backup and if source directory doesnt exist, error
  Backup Location: Ask where to save backup, if destination directory does not exist, then use mkdir and create it
  Backup Type: Simple copy (cp) or Compressed archive (tar) 
  Naming: Create backup with timestamp (backup_YYYYMMDD_HHMMSS.tar.gz) 
  Verification: Check if backup was successful if not throw error
  Summary: Display backup details (size, location, time taken) 
  added old backup deletion(new 5)
  backup log file
  email rotation
-For User Account Reporter:
  Total number of users 
  Total system users (UID < 1000) 
  Total regular users (UID >= 1000) 
  Users currently logged in 
  Username, User ID (UID), Home directory, Default shell
  Group Information 
  List all groups 
  Count members in each group 
  Users without passwords 
  Users with UID 0 (root privileges) 
  Inactive users (never logged in) 
-For System Information Display:
  Display of the user details, as it accomodates all kinds of width using -15s etc.

Challenges:
-Faced difficulty in formatting the 1st question, as the end decorative braces wee not aligned perfectly in a straight line.
-Faced difficulty while remembering some commands for IP address related commands.
-Faced difficulty implementing the 5th question, as it involved implementing lastlogin, which was not possible, including the implementation of saving the report to HTML and creation of graphs.

1st Q
<img width="516" height="270" alt="image" src="https://github.com/user-attachments/assets/5bbdf33d-1051-4e86-98ff-cb56d65a87f4" />

2nd Q
<img width="578" height="656" alt="image" src="https://github.com/user-attachments/assets/618a832a-ba09-4e42-970f-fb6201275afb" />
<img width="482" height="906" alt="image" src="https://github.com/user-attachments/assets/2fcb4ba4-7133-4cb6-b761-d05ad4ce303b" />
<img width="431" height="916" alt="image" src="https://github.com/user-attachments/assets/f4a872ef-f4b8-4bb8-b7eb-de95a9e28c11" />
<img width="484" height="963" alt="image" src="https://github.com/user-attachments/assets/f5df564e-cd8d-408f-a300-d6703dc8658c" />

3rd Q
<img width="608" height="684" alt="image" src="https://github.com/user-attachments/assets/8aba8638-6aee-41e5-8376-ab6cf74f1345" />

4th Q
<img width="661" height="747" alt="image" src="https://github.com/user-attachments/assets/3954b445-2ef0-4289-8548-64e32d15dca9" />

5th Q
<img width="628" height="934" alt="image" src="https://github.com/user-attachments/assets/5b0b8806-eeee-4580-8e75-b5002cffe077" />
<img width="425" height="893" alt="image" src="https://github.com/user-attachments/assets/e390c299-3026-4999-87f6-ef7610727b66" />
