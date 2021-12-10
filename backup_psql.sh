#!/bin/bash

HOSTNAME= root
USERNAME= Shivanjalee
PASSWORD= Shivan@123
DATABASE= Webonators

echo "Pulling database Webonators"
export PGPASSWORD="$PASSWORD"
pg_dump -F t -h $HOSTNAME -U $USERNAME Webonators > $(date +%Y-%m-%d).backup
unset PGPASSWORD
gzip $(date +%Y-%m-%d).backup
echo "Pull Complete"

echo "clearing old backups"
find . -type f -iname '&*.backup.gz' -ctime +15 -not -name '????-??-01.backup.gz' -delete
echo "clearing complete"
