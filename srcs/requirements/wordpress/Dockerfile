FROM debian:buster

WORKDIR /

RUN apt-get -y update \
&& apt-get -y --no-install-recommends install ca-certificates wget php7.3 php-mysqli php-fpm \
&& mkdir -p /usr/share/webapps/ && cd /usr/share/webapps/ \
&& wget http://wordpress.org/wordpress-5.9.5.tar.gz \
&& tar -xzvf wordpress-5.9.5.tar.gz && rm wordpress-5.9.5.tar.gz

COPY ./conf/entrypoint.sh /entrypoint.sh
COPY ./conf/wp-config.php /var/www/wp-config.php

ENTRYPOINT [ "/entrypoint.sh" ]