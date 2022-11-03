#!/bin/bash

while ! mariadb --host=${MYSQL_HOST} --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE} &> /dev/null; do
        echo "Waiting on mariadb config"
        sleep 2
    done

if [ ! -f wp-config.php ]; then
    echo "Installing wordpress"
    wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST:$MYSQL_PORT --prompt=$MYSQL_PASSWORD --quiet
    wp core install --allow-root --url='cybattis.42.fr' --title='INCEPTION' --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=cybattis@student.42lyon.fr --skip-email
    wp user create --allow-root $WORDPRESS_USER "$WORDPRESS_USER"@randomuser.com --role='subscriber' --user_pass=$WORDPRESS_PASSWORD
    wp theme install twentytwenty --activate --allow-root
    # wp option update comment_registration 1 --allow-root
    echo "Wordpress installed"
else
    echo "Wordpress already install"
fi

exec "$@"
