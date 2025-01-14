FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-curl \
    # php7.4-gd \
    # php7.4-mbstring \
    # php7.4-xml \
    php7.4-zip \
    curl \
    wget \
    unzip && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html
RUN mkdir -p /run/php && chmod 755 run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/wp.sh /var/www/html
COPY ./conf/wp-config.php /var/www/html
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN chmod +x /var/www/html/wp.sh

ENTRYPOINT [ "/var/www/html/wp.sh" ]

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]

