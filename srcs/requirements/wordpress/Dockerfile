FROM debian:buster

# USER $WORDPRESS_USER

EXPOSE 9000

RUN apt-get -y update && apt-get upgrade -y \
&& apt-get install -y --no-install-recommends ca-certificates telnet php-cli curl \
php7.3 php-mysql php-fpm mariadb-client telnet \
&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& php wp-cli.phar --info \
&& chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp \
&& wp cli update

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
RUN mkdir /run/php/

RUN mkdir -p /var/www/wordpress
WORKDIR /var/www/wordpress

COPY ./conf/entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
