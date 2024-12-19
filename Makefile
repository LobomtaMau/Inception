# makefile

all: build up

build:
	@echo "Building all Docker images..."
	docker-compose build

up:
	@echo "Starting all containers..."
	docker-compose up -d

down:
	@echo "Stopping all containers..."
	docker-compose down

clean: down
	@echo "Cleaning up unused volumes..."
	docker volume prune -f
	@echo "Cleaning up unused images..."
	docker image prune -f

re: clean all

ex: 