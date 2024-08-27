#!/bin/bash
# text descriptions of the tables in your MySQL database.
DB_NAME=""
USER=""
PASSWORD=""

TABLES=$(mysql -h 127.0.0.1 -u $USER -p$PASSWORD -D $DB_NAME -e 'SHOW TABLES;' | awk '{ print $1}' | grep -v '^Tables')

for TABLE in $TABLES
do
    echo "Structure of $TABLE:"
    mysql -h 127.0.0.1 -u $USER -p$PASSWORD -D $DB_NAME -e "DESCRIBE $TABLE;"
    echo ""
done
