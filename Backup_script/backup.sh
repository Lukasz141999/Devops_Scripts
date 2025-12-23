#!/bin/bash
#simple backup script

source=$1
backup_dir="/backup/location/path"
timestamp=$(date +'%Y-%d-%m_%H:%M:%S')
backup_name=$(basename "$source")_$timestamp.tar.gz

if [ -z "$source" ]; then
	if [ "$DRY_RUN" = true ]; then
        	echo "[DRY-RUN] Would send message: Please provide file source fit to this example ./backup.sh file_to_backup.example and exit program"
        	exit
    	else
		echo "Please provide file source fit to this example ./backup.sh file_to_backup.example"
		exit
	fi
elif [ ! -e "$source" ]; then
	if [ "$DRY_RUN" = true ]; then
        	echo "[DRY-RUN] Would send message: File no exist and exit program"
        	exit
    	else
		echo "File no exist"
		exit
	fi
fi

mkdir -p "$backup_dir"

tar -czf "$backup_dir/$backup_name" -C "$(dirname "$source")" "$(basename "$source")"

if [ -e "$backup_dir/$backup_name" ]; then
	if [ "$DRY_RUN" = true ]; then
        	echo "[DRY-RUN] Would send message: success"
    	else
		echo "success"
	fi
fi