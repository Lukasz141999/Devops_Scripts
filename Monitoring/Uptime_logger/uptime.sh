#!/bin/bash
# This script reads uptime and appends it to a log file
# Supports log rotation (1MB) and simple dry-run mode

log_dir="/var/log/uptime-logger"
log_file="$log_dir/uptime.log"

MAX_SIZE=$((1024 * 1024))   # 1 MB
DRY_RUN=${DRY_RUN:-false}

date="$(date '+%Y-%m-%d %H:%M:%S')"
uptime="$(uptime -p)"

# create log directory if not exists
if [ ! -d "$log_dir" ]; then
    if [ "$DRY_RUN" = true ]; then
        echo "[DRY-RUN] Would create directory $log_dir"
    else
        mkdir -p "$log_dir"
    fi
fi

# log rotation up to 1MB
if [ -f "$log_file" ]; then
    size=$(stat -c%s "$log_file")

    if [ "$size" -ge "$MAX_SIZE" ]; then
        if [ "$DRY_RUN" = true ]; then
            echo "[DRY-RUN] Would rotate log file $log_file"
        else
            mv "$log_file" "$log_file.1"
        fi
    fi
fi

# write uptime to log
if [ "$DRY_RUN" = true ]; then
    echo "[DRY-RUN] Would write:"
    echo "[$date]: $uptime -> $log_file"
else
    echo "[$date]: $uptime" >> "$log_file"
fi