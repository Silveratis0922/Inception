cd /var/www/wordpress

wp core config	--dghost=$DB_HOST \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASSWORD \
		--allow-root

wp core install	--title=$WP_TITLE \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_MAIL \
		--url=$WP_URL \
		--allow-root

wp user create $WP_USER $WP_USER_MAIL --rol=author --user_pass=$WP_USER_PASSWORD --allow-root

cd -

php-fpm7.4 -F
