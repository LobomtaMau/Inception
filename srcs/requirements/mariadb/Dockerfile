FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    # apt-utils \
    mariadb-server && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 3306

COPY ./conf/my.cnf /etc/mysql/conf.d/

CMD ["tail", "-f", "/dev/null"]
# CMD ["mysqld_safe", "--bind-address=0.0.0.0"]
