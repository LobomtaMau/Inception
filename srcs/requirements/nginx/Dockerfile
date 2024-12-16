
FROM nginx:stable-alpine

# Copy your custom configuration file
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

# Copy SSL certificates (self-signed for testing)
COPY ./ssl /etc/nginx/ssl

# Copy static website files to the container
COPY ./html /usr/share/nginx/html

EXPOSE 443

# Command to start NGINX
CMD ["nginx", "-g", "daemon off;"]
