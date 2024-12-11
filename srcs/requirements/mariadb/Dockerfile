# Step 1: Use a base image (debian or alpine)
FROM debian:bullseye

# Step 2: Install MariaDB server and utilities
RUN apt-get update && apt-get install -y apt-utils mariadb-server && rm -rf /var/lib/apt/lists/*

# Step 3: Create necessary directories and set permissions for MariaDB
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

# Step 4: Expose MariaDB's port (3306) to the host
EXPOSE 3306

# Step 5: Set environment variables for MariaDB
ENV MYSQL_ROOT_PASSWORD=supersecurepassword

# Step 6: Start the MariaDB server
CMD ["mysqld"]



# test
# docker run --name mariadb_test -e MYSQL_ROOT_PASSWORD=supersecurepassword -p 3306:3306 mariadb_image
# docker exec -it mariadb_test mysql -u root -p

