#!/bin/sh

mkdir -p /run/mysqld /var/lib/mysql
chown -R mysql:mysql /run/mysqld /var/lib/mysql

if [ ! -d /var/lib/mysql/mysql ]; then
  echo "initialize databases..."
  mysql_install_db --user=mysql --rpm
fi

rsyslogd && /usr/bin/mysqld_safe --syslog

                