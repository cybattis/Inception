FROM debian:buster

EXPOSE 443

RUN apt-get -y update && apt-get -y install \
    openssl nginx \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /etc/nginx/ssl \
    && openssl req -x509 -nodes -days 365 \
    -subj  "/C=FR" \
    -newkey rsa:2048 -keyout /etc/nginx/ssl/ssl_certificate_key.key \
    -out /etc/nginx/ssl/ssl_certificate.crt \
    && rm /etc/nginx/sites-available/default && rm /etc/nginx/sites-enabled/default

COPY ./conf/php.ini /etc/php/7.3/cli/
COPY ./conf/nginx.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf \
    && chmod 777 /etc/nginx/ssl/* \
    && chmod 777 -R /var/www \
    && chown -R www-data:www-data /var/www/

CMD ["nginx", "-g", "daemon off;"]