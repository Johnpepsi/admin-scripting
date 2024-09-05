#!/bin/bashsss

# Variables
SOURCE_DIR="/home/user/data"
DESTINATION_DIR="user@backupserver:/backup/data"
LOG_FILE="/var/log/backup.log"

# Run rsync to backup data
rsync -avh --delete $SOURCE_DIR $DESTINATION_DIR >> $LOG_FILE 2>&1

# Log completion time
echo "Backup completed on $(date)" >> $LOG_FILE
