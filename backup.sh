#!/bin/bash

# Script to backup a directory

# Variables
SOURCE_DIR="$1"
BACKUP_DIR="$2"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

# Check if both arguments are provided
if [ -z "$SOURCE_DIR" ] || [ -z "$BACKUP_DIR" ]; then
    echo "Usage: $0 source_directory backup_directory"
    exit 1
fi

# Create the backup
echo "Backing up $SOURCE_DIR to $BACKUP_DIR/$BACKUP_NAME"
tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
else
    echo "Backup failed."
    exit 1
fi
