#! /bin/bash

# It will back up a file or a folder 

# Name of the back-up file should be like this -> "file_name_ddmmyyyy_HHMM.tar.gz"

# SYNOPSIS : ./my_backup.sh file [-C]

# DESCRIPTION : -C Backs-up a folder.


LOCATION_TO_BACKUP=$1
BACKUP_LOCATION=~/BACKUP
OPTION=$2

# cutting the last part of LOCATION_TO_BACKUP, will be used as file name for the archive file.

ARCHIVE=$(echo $LOCATION_TO_BACKUP | sed "sX.*/\(.*\)X\1X")


TIME_STAMP=$(date "+%d%m%Y_%H%M")
ARCHIVE_FILE_NAME=$ARCHIVE\_$TIME_STAMP.tar.gz
TOTAL_NUMBER_OF_ARGUMENTS=$#

if [ $TOTAL_NUMBER_OF_ARGUMENTS -ge 2 ]; then
  tar cvfz $BACKUP_LOCATION/$ARCHIVE_FILE_NAME $OPTION $LOCATION_TO_BACKUP .
  exit
fi

tar cvfz $BACKUP_LOCATION/$ARCHIVE_FILE_NAME $LOCATION_TO_BACKUP



