#!/bin/bash

    # Remplace la ligne "listen = /run/php/php7.3-fpm.sock" par "listen = 9000" dans le fichier www.conf
    sed -i "s/listen = /run/php/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";

#Change les propriétaires des fichiers dans /var/www/ au groupe et à l'utilisateur www-data
    chown -R www-data:www-data /var/www/;

    # Donne les permissions 755 aux fichiers dans /var/www/
    chown -R 755 /var/www/;

    # Crée le répertoire /run/php/ s'il n'existe pas
    mkdir -p /run/php/;

    # Crée un fichier vide /run/php/php7.3-fpm.pid s'il n'existe pas
    touch /run/php/php7.3-fpm.pid;

#Si le fichier wp-config.php n'existe pas, alors on va lancer l'installation de Wordpress
if [ ! -f /var/www/html/wp-config.php ]; then

    echo "${WP_ADMIN_LOGIN} est mon login !"
    cat /var/www/wp-config.php

    # Crée le répertoire s'il n'existe pas
    mkdir -p /var/www/html;

    # Télécharge et installe wp-cli
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
    chmod +x wp-cli.phar; 
    mv wp-cli.phar /usr/local/bin/wp;

    cd /var/www/html;

    # Télécharge la version de base de Wordpress
    wp core download --allow-root;

    # Déplace le fichier wp-config dans /var/www/html
    mv /var/www/wp-config.php /var/www/html/;

    # Installe Wordpress avec les paramètres fournis
    wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL};

#Crée un nouvel utilisateur
    wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};

    echo "Wordpress setup";
fi

exec "$@"