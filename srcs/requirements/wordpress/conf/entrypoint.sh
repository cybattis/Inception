#!/bin/bash

if [ ! -f /var/www/wordpress/wp-config.php ]; then
    echo "Installing wordpress"
    cd /var/www/wordpress
    wp core download --allow-root --force 
    wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST:$MYSQL_PORT --prompt=$MYSQL_PASSWORD
    wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_NAME --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=cybattis@student.42lyon.fr --skip-email
  
    wp user create --allow-root $WORDPRESS_USER "$WORDPRESS_USER"@randomuser.com --role='subscriber' --user_pass="$WORDPRESS_PASSWORD"
   
    # wp option update comment_registration 1 --allow-root
    # wp theme install --allow-root dark-mode --activate

    echo "Wordpress installed"
else
    echo "Wordpress already install"
fi

exec "$@"