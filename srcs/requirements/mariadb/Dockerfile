FROM debian:buster

WORKDIR /

RUN apt-get -y update \
&& apt-get -y --no-install-recommends install mariadb-server php-mysql

CMD ["mysql", "-u", "root"]
