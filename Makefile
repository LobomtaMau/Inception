# Makefile for Docker Inception Project

all: setup build up

setup:
	@echo "Creating necessary directories & files..."
	mkdir -p ./vol_db ./vol_wp
#	@if [ ! -f ./mysql_root_password.txt ]; then echo "wp_pass" > ./mysql_root_password.txt; fi

build:
	@echo "Building all Docker images..."
#	docker-compose build
	docker compose build

up:
	@echo "Starting all containers..."
#	docker-compose up -d
	docker compose up -d

down:
	@echo "Stopping all containers..."
#	docker-compose down
	docker compose down

clean: down
	@echo "Cleaning up Docker resources..."
	docker image prune -af
#	docker volume prune -f
	docker volume rm inception_mariadb_data inception_wordpress_data || true
	docker network prune -f

xxxclean: clean
	@echo "Removing setup directories..."
	sudo rm -rf ./vol_db ./vol_wp ./mysql_root_password.txt

re: xxxclean all

status:
	docker ps -a
	@echo
	docker image ls
	@echo
	docker volume ls
	@echo
	docker network ls
