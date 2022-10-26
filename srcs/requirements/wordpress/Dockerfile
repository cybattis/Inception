FROM debian:buster

WORKDIR /

USER $WORDPRESS_USER

EXPOSE 9000

RUN apt-get -y update \
&& apt-get install -y --no-install-recommends ca-certificates php-cli curl php7.3 php-mysqli php-fpm mariadb-client \
&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& php wp-cli.phar --info \
&& chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp \
&& wp cli update

COPY ./conf/entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
