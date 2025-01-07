
all: setup build up

setup:
	@echo "Creating necessary directories & files..."
	mkdir -p ./vol_db
	mkdir -p ./vol_wp
	@if [ ! -f ./mysql_root_password.txt ]; then echo "wp_pass" > ./mysql_root_password.txt; fi

build:
	@echo "Building all Docker images..."
	docker compose build

up:
	@echo "Starting all containers..."
	docker compose up -d

down:
	@echo "Stopping all containers..."
	docker compose down

clean: down 
	@echo "Cleaning up unused volumes..."
	docker volume prune -f
	@echo "Cleaning up unused images..."
	docker rmi -f mariadb_test_img wordpress_test_img nginx_test_img
# docker network rm $$(docker network ls --filter "name=$(NAME)" -q)

re: clean all

rmfolders:
	@sudo rm -rf ~/vol_db/**
	@sudo rm -rf ~/vol_wp/**
	@echo Folders cleaned

ex: #systen prune