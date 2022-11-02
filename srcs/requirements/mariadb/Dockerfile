FROM debian:buster

EXPOSE 3306

RUN apt-get update -y && apt-get -y install \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/db.sql /db.sql

RUN service mysql start && mysql < db.sql \
    && rm -f db.sql

CMD [ "mysqld_safe", "--datadir=/var/lib/mysql" ]
