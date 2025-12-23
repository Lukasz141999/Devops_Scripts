#!/bin/bash
# Disk usage monitoring script with stdout, stderr
# Supports dry-run mode

THRESHOLD_WARNING=80
THRESHOLD_CRITICAL=90
DRY_RUN=${DRY_RUN:-false}

# get disk usage percentage
usage=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

timestamp=$(date "+%Y-%m-%d %H:%M:%S")


if [ "$usage" -ge "$THRESHOLD_WARNING" ] && [ "$usage" -lt "$THRESHOLD_CRITICAL" ]; then
    if [ "$DRY_RUN" = true ]; then
        echo "[DRY-RUN] Would send WARNING: alert for disk usage ${usage}%"
    else
        echo "[$timestamp] WARNING: Disk usage is at ${usage}%"
    fi
fi


if [ "$usage" -ge "$THRESHOLD_CRITICAL" ]; then
    if [ "$DRY_RUN" = true ]; then
        echo "[DRY-RUN] Would send CRITICAL alert for disk usage ${usage}%"
    else
        echo "[$timestamp] CRITICAL: Disk usage is at ${usage}%" >&2
    fi
fi
