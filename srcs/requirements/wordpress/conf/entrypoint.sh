#!/bin/bash
set -e

mkdir -p /var/www/wordpress

if [ ! -f /var/www/wordpress/index.php ]; then
    echo -e "Installing wordpress"
    cd /var/www/wordpress
    wp core download --allow-root --path=/var/www/wordpress
    wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --prompt=$MYSQL_PASSWORD
    wp db create
    wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_NAME --admin_user=$WORDPRESS_ADMIN \
    --admin_password=$WORDPRESS_ADMIN_PASSWORD
    wp server --allow-root --port=443 --host=127.0.0.1
    mkdir -p /var/run/
fi

php-fpm7.3 -FR
