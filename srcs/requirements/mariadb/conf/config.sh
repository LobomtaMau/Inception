#!/bin/bash

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
    echo "Configuring MariaDB..."

    service mariadb start
    sleep 1

    mysql_secure_installation <<-END
	y
	$MYSQL_ROOT_PASSWORD
	$MYSQL_ROOT_PASSWORD
	y
	y
	y
	y
	END

	mysql -u root <<-EOF
		CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
		CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
		GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
		FLUSH PRIVILEGES;
		ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
		FLUSH PRIVILEGES;
	EOF

	sleep 1

	mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown
	echo "Database created. Shutting down MariaDB..."
fi

echo "Starting MariaDB..."
exec "$@"