#!/bin/bash

if ! wp core is-installed --quiet --allow-root; then
    echo "Installing wordpress"
    wp core download --allow-root
    wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST:$MYSQL_PORT --prompt=$MYSQL_PASSWORD
    wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_NAME --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=cybattis@student.42lyon.fr
    wp user create $WORDPRESS_USER "$WORDPRESS_USER"@randomuser.com --role='subscriber' --user_pass="$WORDPRESS_PASSWORD" --allow-root
    wp option update comment_registration 1 --allow-root

    chown www-data:www-data -R /var/www/wordpress
    chmod -R 755 /var/www/wordpress
else
    echo "Wordpress already install"
fi

exec /usr/sbin/php-fpm7.3 -FR
