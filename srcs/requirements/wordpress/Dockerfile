FROM	debian:bullseye

RUN	apt update -y && \
	apt upgrade -y && \
	apt-get install wget -y

RUN	apt-get install -y php7.4 \
	php-fpm \
	php-mysql \
	mariadb-client \
	vim

RUN	wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN	cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN	chown -R root:root /var/www/wordpress

COPY	conf/www.conf	/etc/php/7.4/fpm/pool.d/www.conf

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN	chmod +x wp-cli.phar

RUN	mv wp-cli.phar /usr/local/bin/wp

COPY	conf/config.sh /var/www/wordpress/config.sh
RUN	chmod +x /var/www/wordpress/config.sh
CMD	["bash", "/var/www/wordpress/config.sh"]
