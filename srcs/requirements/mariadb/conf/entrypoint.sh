#!/bin/bash

if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ]; then
    service mysql start
    mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
    mysql -e "USE ${MYSQL_DATABASE};"
    mysql -e "CREATE USER IF NOT EXISTS ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "FLUSH PRIVILEGES;"
    sleep 3
    service mysql stop
    echo "Database setup"
else
    echo "Database already setup"
fi

exec "$@"
