FROM gjchen/alpine:latest
MAINTAINER gjchen <gjchen.tw@gmail.com>

RUN	apk --no-cache --no-progress upgrade -f && \
	apk --no-cache --no-progress add mariadb && \
	mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && \
	mysql_install_db --user=mysql --rpm


CMD rsyslogd; /usr/bin/mysqld_safe --syslog; # --nowatch; crond -f;
