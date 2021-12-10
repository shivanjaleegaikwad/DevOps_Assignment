#!/bin/sh

echo "starting db backup"
day= "$(date +'%A')"
db_backup="mydb_${day}.sql"
sudo mysqldump  -u root -p  user >/home/${db_backup}
echo "db backup complete"
                           