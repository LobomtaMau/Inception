FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    curl \
    mariadb-client \
    unzip \
    && docker-php-ext-install mysqli

# WORKDIR /var/www/html

# COPY ./html /var/www/html

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

EXPOSE 9000

CMD ["php-fpm"]
