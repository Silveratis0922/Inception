FROM 	debian:bullseye

ARG	DB_NAME=${DB_NAME}
ARG	DB_USER=${DB_USER}
ARG	DB_PASSWORD=${DB_PASSWORD}
ARG	DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD}

RUN	apt update -y
RUN	apt upgrade -y
RUN	apt install vim -y
RUN	apt-get install mariadb-server -y

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	tools/user.sh /

RUN	bash ./user.sh

CMD	["mysqld_safe"]
