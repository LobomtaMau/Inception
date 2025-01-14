#!/bin/sh

sleep 3

cd /var/www/html

if [ -d "/var/www/html/wp-admin" ]; then
    echo "WordPress is already installed."
else
    chmod 755 /var/www/html
    chown -R www-data:www-data /var/www/html

    echo "Downloading WordPress..."
    wp core download --allow-root

    echo "Installing WordPress..."
    wp core install --allow-root --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_USER1 \
        --admin_password=$WP_PASS1 \
        --admin_email=$WP_EMAIL1 --skip-email

    echo "Creating additional user..."
    wp user create --allow-root \
        $WP_USER2 $WP_EMAIL2 \
        --user_pass=$WP_PASS2
fi

echo "WordPress is online!"
exec $@
