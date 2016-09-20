FROM gjchen/alpine:latest
MAINTAINER gjchen <gjchen.tw@gmail.com>

RUN	apk --no-cache --no-progress upgrade -f && \
	apk --no-cache --no-progress add mariadb && \
	mkdir -p /run/mysqld /var/lib/mysql

ADD	mariadb.sh /usr/local/bin
VOLUME	[ "/run/mysqld", "/var/lib/mysql", "/etc/mysql" ]
ENTRYPOINT	[ "/usr/local/bin/mariadb.sh" ]
