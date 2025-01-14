FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    nginx openssl && \
    rm -rf /var/lib/apt/lists/*

RUN chown -R www-data:www-data /var/www/html
# mkdir -p /var/www/html && 

COPY ./ssl /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
