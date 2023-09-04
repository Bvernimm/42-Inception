#!/bin/bash
wp config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 \
					--path='/var/www/wordpress'
wp core install     --url=$DOMAIN\
                    --title=$WP_TITLE\
                    --admin_user=$WP_ADMIN\
                    --admin_password=$WP_ADMIN_PASSWORD\
                    --allow-root
wp user create      $WP_USER\
                    --role=author\
                    --user_pass=$WP_USER_PASSWORD\
                    --allow-root