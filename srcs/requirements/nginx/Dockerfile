FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    nginx openssl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html


EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
