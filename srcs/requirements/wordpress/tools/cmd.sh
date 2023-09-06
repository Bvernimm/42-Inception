#!/bin/bash

chown -R www-data:www-data /var/www/*
chown -R 755 /var/www/* 
mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid
adduser www-data
addgroup www-data www-data
addgroup root www-data
wp core download --allow-root