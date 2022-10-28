FROM debian:buster

WORKDIR /

RUN apt-get -y update && apt-get upgrade -y \
&& apt-get -y --no-install-recommends install openssl nginx \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& mkdir /etc/nginx/ssl \
&& openssl req -x509 -nodes -days 365 \
-subj  "/C=FR" \
-newkey rsa:2048 -keyout /etc/nginx/ssl/ssl_certificate_key.key \
-out /etc/nginx/ssl/ssl_certificate.crt

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf

CMD ["nginx", "-g", "daemon off;"]