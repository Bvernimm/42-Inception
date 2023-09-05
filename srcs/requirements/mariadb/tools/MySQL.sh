#!/bin/bash

echo "MariaDB Setup";

# Modifie les champs pour donner la valeur des variables d'environnement
sed -i "s/DB_NAME/${DB_NAME}/" /var/www/initial_db.sql;
sed -i "s/WP_ADMIN_LOGIN/${WP_ADMIN_LOGIN}/" /var/www/initial_db.sql;
sed -i "s/WP_ADMIN_PASSWORD/${WP_ADMIN_PASSWORD}/" /var/www/initial_db.sql;

echo "${DB_NAME} est ok avec ${WP_ADMIN_LOGIN} et ${WP_ADMIN_PASSWORD}";

# Lance MySQL
exec mysqld_safe --init-file=/var/www/initial_db.sql