FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    # apt-utils \
    nginx openssl && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./ssl /etc/nginx/ssl

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

# FROM nginx:stable-alpine

# COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

# COPY ./ssl /etc/nginx/ssl

# COPY ./html /usr/share/nginx/html

# EXPOSE 443

# CMD ["nginx", "-g", "daemon off;"]
