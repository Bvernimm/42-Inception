#!/bin/bash

chmod +x wp-cli.phar
cp wp-cli.phar /usr/bin/wp
sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"
chown -R www-data:www-data /var/www/*
chown -R 755 /var/www/* 
mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid
adduser www-data
# ?
addgroup www-data www-data
addgroup root www-data
# wp core download --allow-root

# echo "Wassup";
# pwd;
# echo "Wassup";