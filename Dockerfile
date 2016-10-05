FROM gjchen/alpine:latest
MAINTAINER gjchen <gjchen.tw@gmail.com>

RUN	apk --no-cache --no-progress upgrade -f && \
	apk --no-cache --no-progress add mariadb && \
	mkdir -p /run/mysqld /var/lib/mysql

ENV	MYSQLD="/usr/bin/mysqld_safe"
ENV	MYSQLD_OPT="--syslog"

ADD	mariadb.sh /usr/local/bin

EXPOSE	3306
VOLUME	[ "/run/mysqld", "/var/lib/mysql", "/etc/mysql" ]
ENTRYPOINT	[ "/usr/local/bin/mariadb.sh" ]
