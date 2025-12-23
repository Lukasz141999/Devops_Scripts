# Backup Script 

Bash script for creating compressed backups (`.tar.gz`) of files or directories.



## Features

 - Accepts file or directory as an argument
 - Creates compressed `.tar.gz` backups
 - Automatically creates backup directory if it does not exist
 - Timestamped backup filenames
 - Basic input validation
 - Dry-run mode (simulates actions without creating files)
 - Suitable for cron-based backups


## Configuration
 - Edit the following variables in the script:
  backup_dir="/backup/location/path"

## Usage

 - Make the script executable:
  chmod +x backup.sh

 - Run normally:
  ./baskup.sh example.file

 - Dry-run mode:
  DRY\_RUN=true ./baskup.sh example.file

