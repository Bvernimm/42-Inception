#!/bin/bash

echo "MariaDB Setup";

# Modifie les champs pour donner la valeur des variables d'environnement
sed -i "s/SQL_DATABASE/${SQL_DATABASE}/" /usr/local/bin/initial_db.sql;
sed -i "s/SQL_USER/${SQL_USER}/" /usr/local/bin/initial_db.sql;
sed -i "s/SQL_PASSWORD/${SQL_PASSWORD}/" /usr/local/bin/initial_db.sql;

# echo "${SQL_DATABASE} est ok avec ${SQL_USER} et ${SQL_PASSWORD}";

# Lance MySQL
exec mysqld_safe --init-file=/usr/local/bin/initial_db.sql