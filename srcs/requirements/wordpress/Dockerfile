FROM debian:buster

EXPOSE 9000

RUN apt-get -y update && apt-get install -y \
    wget \
    mariadb-client \
    php7.3 \
    php-fpm \
    php-mysql \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /run/php/ && mkdir -p /var/www/wordpress \
    && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && php wp-cli.phar --info \
    && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp \
    && wp core download --allow-root --path=/var/www/wordpress \
    && chown www-data:www-data -R /var/www/wordpress \
    && chmod -R 755 /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./conf/entrypoint.sh /

WORKDIR /var/www/wordpress

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/usr/sbin/php-fpm7.3", "--nodaemonize" ]
