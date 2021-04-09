#!/bin/bash

script="$0"
basename="$(dirname $script)"
source "${basename}/config.sh"

DB_BACKUP_PATH="${basename}/${DB_BACKUP_RELATIVE_PATH}"
MAINTENANCE_LOG_PATH="${basename}/${MAINTENANCE_LOG}"
read -r -p "Are you sure? [y/N] " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
  echo "Restoring events tables to ${DATABASE_NAME}"

  mysql -h ${MYSQL_HOST} \
    -P ${MYSQL_PORT} \
    -u ${MYSQL_USER} \
    -p${MYSQL_PASSWORD} \
    ${DATABASE_NAME} < ${DB_BACKUP_PATH}/tablesinvolved.sql 2>${MAINTENANCE_LOG_PATH}

  if [ $? -eq 0 ]; then
    echo "Database successfully restored"
    exit 0
  else
    echo "Error found during restoration"
    exit 1
  fi
else
  echo "Restore canceled"
  exit 1
fi
