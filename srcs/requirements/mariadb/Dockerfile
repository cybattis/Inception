FROM debian:buster

WORKDIR /

EXPOSE 3306

RUN apt-get -y update \
&& apt-get install -y --no-install-recommends software-properties-common \
&& rm -rf /var/lib/apt/lists/*

RUN apt-get update \
&& apt-get install -y --no-install-recommends mariadb-server \
&& rm -rf /var/lib/apt/lists/* \
&& sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf \
&& update-rc.d -f mysql disable

# COPY ./tools/entrypoint.sh /entrypoint.sh

CMD [ "mysqld_safe" ]
