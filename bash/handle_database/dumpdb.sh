#!/bin/bash

script="$0"
basename="$(dirname $script)"
source "${basename}/config.sh"

DB_BACKUP_PATH="${basename}/${DB_BACKUP_RELATIVE_PATH}"
MAINTENANCE_LOG_PATH="${basename}/${MAINTENANCE_LOG}"

echo "Backup started for full database - ${DATABASE_NAME}"

mysqldump -h ${MYSQL_HOST} \
   -P ${MYSQL_PORT} \
   -u ${MYSQL_USER} \
   -p${MYSQL_PASSWORD} \
   ${DATABASE_NAME} > ${DB_BACKUP_PATH}/full.sql 2>${MAINTENANCE_LOG_PATH}

if [ $? -eq 0 ]; then
  echo "Database backup successfully completed"
  exit 0
else
  echo "Error found during backup"
  exit 1
fi
