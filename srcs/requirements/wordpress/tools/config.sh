#!/bin/bash

if [ ! -f wp-config.php ]; then
    envsubst < /tools/extra-wp-config.php\
    | wp config create	--allow-root \
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

    # wp theme install teluro --activate --allow-root
    # wp plugin install redis-cache --activate --allow-root
    # wp plugin update --all --allow-root
    # wp plugin activate redis-cache --allow-root
fi
# chown -R www-data:www-data .
# chmod -R 777 .
# wp redis enable --force --allow-root
exec $@