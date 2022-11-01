FROM debian:buster

EXPOSE 443

RUN apt-get -y update && apt-get upgrade -y \
&& apt-get -y --no-install-recommends install openssl nginx \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& mkdir /etc/nginx/ssl \
&& openssl req -x509 -nodes -days 365 \
-subj  "/C=FR" \
-newkey rsa:2048 -keyout /etc/nginx/ssl/ssl_certificate_key.key \
-out /etc/nginx/ssl/ssl_certificate.crt

RUN rm /etc/nginx/sites-available/default && rm /etc/nginx/sites-enabled/default

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

RUN chmod 777 /etc/nginx/ssl/*
RUN chmod 777 -R /var/www 
RUN chown -R www-data:www-data /var/www/

CMD ["nginx", "-g", "daemon off;"]