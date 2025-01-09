FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-curl \
    php7.4-gd \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-zip \
    curl \
    wget \
    unzip && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]

