# Uptime Logger

Bash script to log system uptime with timestamps.  
Supports log rotation (1MB) and dry-run mode for safe testing.


## Features
- Timestamped uptime logs
- Log rotation: automatically rotates log if size exceeds 1 MB
- Simple dry-run mode: simulates actions without modifying files
- Easy to run via cron or systemd


## Usage

 - Make the script executable:
    chmod +x uptime_logger.sh

 - Run normally:
    ./uptime_logger.sh

 - Example log entry:
    [2025-12-22 14:45:01]: up 3 hours, 20 minutes



 - Run dry-run mode:
    DRY_RUN=true ./uptime_logger.sh

 - Example Cron job (run every 5 minutes):
    */5 * * * * /full/path/uptime_logger.sh

