#!/bin/bash

sleep 20

if [ ! -f "/var/www/html/wp-config.php" ]
then
	wp core download --path=/var/www/html --allow-root --force
	
	cd /var/www/html
	
	wp config create --dbname=$SQL_DATABASE \
			 --dbuser=$SQL_USER \
			 --dbpass=$SQL_PASSWORD \
			 --allow-root \
			 --dbhost=mariadb:3306 --path='/var/www/html'
	echo "TITLE = $WP_TITLE"
	wp core install	--title=$WP_TITLE \
			--admin_user=$ADMIN \
			--admin_password=$WP_ADMIN_PASSWORD \
			--admin_email=$WP_ADMIN_MAIL \
			--url=$WP_URL --allow-root --skip-email
	
	wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
fi

if [ ! -d "/run/php" ]
then
	mkdir /run/php
fi

cd -
	
exec php-fpm7.4 -F
