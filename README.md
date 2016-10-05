# gjchen/mariadb@Dockerhub
Alpine Linux with MariaDB configured.

Volumes:
* /run/mysqld for socket binding
* /var/lib/mysql for data store
* /etc/mysql for hosting configuration

Environment Variables:
* MYSQLD="/usr/bin/mysqld_safe" for location of daemon
* MYSQLD_OPT="--syslog" for options

Examples:
* General use:
```
docker run -d --name db \
  -p 3306:3306 \
  -v /opt/mysql/run_mysqld/:/run/mysqld \
  -v /opt/mysql/var_lib_mysql/:/var/lib/mysql \
  gjchen/mariadb
```

* start with --syslog and --skip-grant-tables options
```
docker run -d --name db \
  -p 3306:3306 \
  -v /opt/mysql/run_mysqld/:/run/mysqld \
  -v /opt/mysql/var_lib_mysql/:/var/lib/mysql \
  -e MYSQLD_OPT="--syslog --skip-grant-tables" \
  gjchen/mariadb
```

