FROM debian:buster

WORKDIR /

RUN apk add --no-cache wget php-fpm && \
mkdir -p /usr/share/webapps/ && cd /usr/share/webapps/ && \
wget http://wordpress.org/latest.tar.gz && \
tar -xzvf latest.tar.gz && rm latest.tar.gz

ENTRYPOINT [ "entrypoint.sh" ]