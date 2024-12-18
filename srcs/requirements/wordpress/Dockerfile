FROM php:8.1-fpm

# Install dependencies required by WordPress
RUN apt-get update && apt-get install -y \
    curl \
    mariadb-client \
    unzip \
    && docker-php-ext-install mysqli

WORKDIR /var/www/html

COPY ./html /var/www/html

EXPOSE 9000

CMD ["php-fpm"]

# Why This Configuration?
# PHP-FPM: A dedicated FastCGI Process Manager for handling PHP requests efficiently.
# Dependencies: Installs tools like mariadb-client (for database interaction) 
#   and PHP extensions like mysqli (required for WordPress).
# Port 9000: PHP-FPM listens on port 9000, which NGINX will forward PHP requests to.