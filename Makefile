# Default target
all: build up

# Build all Docker images
build:
	@echo "Building all Docker images..."
	docker-compose build

# Start all services
up:
	@echo "Starting all containers..."
	docker-compose up -d

# Stop all services
down:
	@echo "Stopping all containers..."
	docker-compose down

# Clean up volumes and containers
clean: down
	@echo "Cleaning up unused volumes..."
	docker volume prune -f
	@echo "Cleaning up unused images..."
	docker image prune -f

# Restart all services
re: clean all


# # Directories for each service
# MARIADB_DIR=srcs/requirements/mariadb
# NGINX_DIR=srcs/requirements/nginx
# WORDPRESS_DIR=srcs/requirements/wordpress

# # Common Docker Compose Commands
# COMPOSE=docker-compose

# # Default target
# all: build up

# # Build Docker images for all services
# build:
# 	@echo "Building all Docker images..."
# 	$(COMPOSE) -f $(MARIADB_DIR)/docker-compose.yml build
# 	$(COMPOSE) -f $(NGINX_DIR)/docker-compose.yml build
# 	$(COMPOSE) -f $(WORDPRESS_DIR)/docker-compose.yml build

# # Start all services
# up:
# 	@echo "Starting all containers..."
# 	$(COMPOSE) -f $(MARIADB_DIR)/docker-compose.yml up -d
# 	$(COMPOSE) -f $(NGINX_DIR)/docker-compose.yml up -d
# 	$(COMPOSE) -f $(WORDPRESS_DIR)/docker-compose.yml up -d

# # Stop all services
# down:
# 	@echo "Stopping all containers..."
# 	$(COMPOSE) -f $(MARIADB_DIR)/docker-compose.yml down
# 	$(COMPOSE) -f $(NGINX_DIR)/docker-compose.yml down
# 	$(COMPOSE) -f $(WORDPRESS_DIR)/docker-compose.yml down

# # Clean up volumes and containers
# clean: down
# 	@echo "Cleaning up unused volumes..."
# 	docker volume prune -f
# 	@echo "Cleaning up unused images..."
# 	docker image prune -f

# # Restart all services
# re: clean all
