#!/bin/sh

sleep 5

cd /var/www/html

if [ -d "/var/www/html/wp-admin" ]; then
    echo "WordPress is already installed."
else
    echo "Downloading WordPress..."
    wp core download --allow-root

    # wp config create --allow-root --dbname=$MYSQL_DATABASE \
    #     --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST

    echo "Installing WordPress..."
    wp core install --allow-root --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_USER \
        --admin_password=$WP_PASS1 \
        --admin_email=$WP_EMAIL

    echo "Creating additional user..."
    wp user create --allow-root \
        $WP_USER2 $WP_EMAIL2 \
        --user_pass=$WP_PASS2
fi

echo "WordPress is online!"
exec $@
