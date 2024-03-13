FROM 	debian:bullseye

ARG	SQL_DATABASE=${SQL_DATABASE}
ARG	SQL_USER=${SQL_USER}
ARG	SQL_PASSWORD=${SQL_PASSWORD}
ARG	SQL_ROOT_PASSWORD=${SQL_ROOT_PASSWORD}

RUN	apt update -y
RUN	apt upgrade -y
RUN	apt install vim -y
RUN	apt-get install mariadb-server -y

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	tools/user.sh /user.sh

RUN	chmod +x /user.sh

CMD	[ "bash", "user.sh"]
