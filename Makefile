# Makefile

COMPOSE_FILE = srcs/docker-compose.yml


all: setup build up

setup:
	@echo "Creating necessary directories & files..."
	mkdir -p /home/mbaptist/data/vol_db /home/mbaptist/data/vol_wp

build:
	@echo "Building all Docker images..."
	docker compose -f $(COMPOSE_FILE) build

up:
	@echo "Starting all containers..."
	docker compose -f $(COMPOSE_FILE) up -d

down:
	@echo "Stopping all containers..."
	docker compose -f $(COMPOSE_FILE) down

clean: down
	@echo "Cleaning up Docker resources..."
	-docker image prune -af
#	-docker volume rm $(docker volume ls -q) || true
	docker volume rm mariadb_data wordpress_data || true
	-docker network prune -f

xxxclean: clean
	@echo "Removing setup directories..."
	sudo rm -rf /home/mbaptist/data/vol_db /home/mbaptist/data/vol_wp

re: xxxclean all

status:
	docker ps -a
	@echo
	docker image ls
	@echo
	docker volume ls
	@echo
	docker network ls --filter "name=icpt_network"
