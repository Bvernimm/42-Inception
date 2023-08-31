FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server

# MariaDB config
COPY conf/MariaDB.conf	/etc/mysql/mariadb.conf.d/MariaDB.conf

EXPOSE 3306

# MySQL setup
COPY tools/MySQL.sh /usr/local/bin
RUN chmod +x /usr/local/bin/MySQL.sh
CMD ["/usr/local/bin/MySQL.sh"]
