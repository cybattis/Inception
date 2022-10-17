
DOCKER_COMPOSE_FILE	= -f ./srcs/docker-compose.yml

# Recipe
################################

start:
	docker compose $(DOCKER_COMPOSE_FILE) up -d 

stop:
	docker compose $(DOCKER_COMPOSE_FILE) down

show:
	docker compose $(DOCKER_COMPOSE_FILE) ps

build:
	docker compose $(DOCKER_COMPOSE_FILE) build

clean:
	docker compose $(DOCKER_COMPOSE_FILE) down --volumes

.PHONY: start stop show build clean
