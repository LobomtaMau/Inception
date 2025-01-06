#!/bin/bash

# Load the root password from the secret
MYSQL_ROOT_PASSWORD=$(cat /run/secrets/mysql_root_password)

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
    echo "Configuring MariaDB..."

    mysqld_safe &

    sleep 3

mysql -u root <<-EOF
    CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
    CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    GRANT ALL PRIVILEGES ON '$MYSQL_DATABASE'.* TO '$MYSQL_USER'@'%';
    FLUSH PRIVILEGES;
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
    FLUSH PRIVILEGES;
EOF

    mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown
    echo "Database created. Shutting down MariaDB..."
fi

echo "Starting MariaDB..."
exec "$@"