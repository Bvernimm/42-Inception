#!/bin/bash

echo "MariaDB Setup";

# Modifie les champs pour donner la valeur des variables d'environnement
sed -i "s/DB_NAME/${DB_NAME}/" /usr/local/bin/initial_db.sql;
sed -i "s/WP_ADMIN_LOGIN/${WP_ADMIN_LOGIN}/" /usr/local/bin/initial_db.sql;
sed -i "s/WP_ADMIN_PASSWORD/${WP_ADMIN_PASSWORD}/" /usr/local/bin/initial_db.sql;

echo "${DB_NAME} est ok avec ${WP_ADMIN_LOGIN} et ${WP_ADMIN_PASSWORD}";

# Lance MySQL
exec mysqld_safe --init-file=/usr/local/bin/initial_db.sql