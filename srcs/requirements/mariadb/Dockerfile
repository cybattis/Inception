FROM debian:buster

EXPOSE 3306

RUN apt update -y && apt upgrade -y \
&& apt-get install -y software-properties-common mariadb-server \
&& rm -rf /var/lib/apt/lists/*

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/db.sql /db.sql

RUN service mysql start && mysql < db.sql
RUN rm -f db.sql

CMD [ "mysqld" ]
