# FROM debian:bullseye

# RUN apt-get update && apt-get install -y apt-utils mariadb-server && rm -rf /var/lib/apt/lists/*

# RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

# EXPOSE 3306

# CMD ["mysqld"]



FROM mariadb:10.5
COPY ./conf/my.cnf /etc/mysql/conf.d/
EXPOSE 3306
