FROM debian:buster

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wget
RUN apt-get install -y php7.3
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
# RUN chmod +x /etc/php/7.3/fpm/pool.d

WORKDIR /var/www/html/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /var/www/html/wordpress
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/cmd.sh /tools/cmd.sh
RUN chmod +x /tools/cmd.sh
RUN /tools/cmd.sh

# RUN chown -R www-data:www-data /var/www/*
# RUN chown -R 755 /var/www/* 
# ?

# RUN mkdir -p /run/php/
# RUN touch /run/php/php7.3-fpm.pid

COPY tools/config.sh /tools/config.sh
COPY tools/wp-config.php /tools/wp-config.php
RUN chmod +x /tools/config.sh
ENTRYPOINT [ "/tools/config.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "-F"]