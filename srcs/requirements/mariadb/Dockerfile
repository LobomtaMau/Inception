FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    mariadb-server && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 3306

COPY ./conf/config.sh /home/config.sh

RUN chmod +x /home/config.sh

ENTRYPOINT ["/home/config.sh"]

CMD ["mysqld_safe", "--bind-address=0.0.0.0"]
