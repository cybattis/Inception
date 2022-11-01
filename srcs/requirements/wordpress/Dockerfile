FROM debian:buster

# USER $WORDPRESS_USER

EXPOSE 9000

RUN apt-get -y update && apt-get upgrade -y \
&& apt-get install -y --no-install-recommends ca-certificates telnet curl mariadb-client \
php7.3 php-mysql php-fpm php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip \
&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& php wp-cli.phar --info \
&& chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp \
&& wp cli update

RUN rm -f /etc/php7/php-fpm.d/www.conf

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir -p /run/php/ \
&& mkdir -p /var/www/wordpress

COPY ./conf/entrypoint.sh /entrypoint.sh

WORKDIR /var/www/wordpress

ENTRYPOINT [ "/entrypoint.sh" ]
