# Inception

Video sobre docker + compose:
# https://www.youtube.com/watch?v=pg19Z8LL06w&t=174s
# https://www.youtube.com/watch?v=SXwC9fSwct8

Comandos Docker:
# docker run --name mariadb_test -e MYSQL_ROOT_PASSWORD=333 -p 3306:3306 mariadb_image
# docker exec -it mariadb_test mysql -u root -p

# docker images                 // mostra os container
# docker ps                     // mostra os containers Running
# docker pull [name+[tag=1.3]]  // 
# docker run [name+tag]         // 
# docker run -d [name+tag]      // 
# docker logs [container+ID]
# docker run  [name+tag]
# docker stop [id/name]

# docker run -d -p [{host_port}:{container_port}] [name]
# -d detatch terminal
# -p port

# docker ps -a                  // show all containers
# docker stop [id/name]
# docker run --name [newname]

# docker build -t [name+tag] . 

Comandos Docker-Compose:
# docker network ls
# docker network [name]


Create a Dockerfile to install MariaDB 
# to get in
# mysql -h mariadb -u wp_user -p


# # start
# # cd Inception/srcs/requirements/mariadb
# # docker-compose build
# # docker-compose up -d
# # docker ps

# # docker exec -it mariadb_test mysql -u root -p
# # SHOW DATABASES;


# ### close
# # docker-compose down -v
# # docker rmi <IMAGE_ID>


# ### check for trash
# # docker ps -a

# how to redirect
# ~/etc   //hosts
# sudo nano 127.0.0.1       mbaptist.42.fr

# "docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volumes ls -q); docker network rm $(docker networks ls -q) 2>/dev/null"

# docker exec -it mariadb bash
# mariadb -u root -p  ///111
# show databases;
# use wp_database;
# show tables;
# select * from wp_users;

# /wp-admin/

# ssh-keygen -t rsa -b 4096 -C "mbaptist@student.42lisboa.com"
# cd ~/.ssh