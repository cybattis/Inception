#!/bin/bash
service mysql start

if mysql "${MYSQL_DATABASE}" >/dev/null 2>&1 </dev/null
then
    echo "-- Create Database"
    mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
    mysql -e "USE ${MYSQL_DATABASE};"

    echo "-- Create User"
    mysql -e "CREATE USER IF NOT EXISTS ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "FLUSH PRIVILEGES;"
    echo "Database setup"
else
    echo "Database already setup"
fi

exec "$@"
