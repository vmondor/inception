#!/bin/bash

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mariadb-install-db --user=mysql --ldata=/var/lib/mysql
fi

echo "Starting MariaDB..."
mysqld --datadir=/var/lib/mysql  &

sleep 10
echo "MariaDB is ready."
DB_EXISTS=$(mysql -u -root -e "SHOW DATABASES LIKE '${SQL_DATABASE}';" | grep ${SQL_DATABASE} || true)

if [ -z "$DB_EXISTS" ]; then
    echo "Configuring MariaDB..."
    mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};
CREATE USER '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
USE ${SQL_DATABASE};
GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' WITH GRANT OPTION;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}'  WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
    touch /var/lib/mysql/.mysql_initialized
fi

mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown
exec mysqld --datadir=/var/lib/mysql

echo "MariaDB database and user were created successfully!"
