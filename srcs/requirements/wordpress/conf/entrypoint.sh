#!/bin/bash

if ! /var/www/wordpress/wp-config.php; then
    echo "Installing wordpress"
    wp core --allow-root download --locale=fr_FR --force 
    wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST:$MYSQL_PORT --prompt=$MYSQL_PASSWORD
    wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_NAME --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=cybattis@student.42lyon.fr --skip-email
    wp user create $WORDPRESS_USER "$WORDPRESS_USER"@randomuser.com --role='subscriber' --user_pass="$WORDPRESS_PASSWORD" --allow-root
    wp option update comment_registration 1 --allow-root

    wp theme install --allow-root dark-mode --activate

    chown www-data:www-data -R /var/www/wordpress
    chmod -R 755 /var/www/wordpress
else
    echo "Wordpress already install"
fi

php-fpm7.3 --nodaemonize
