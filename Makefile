
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
	docker compose $(DOCKER_COMPOSE_FILE) build --no-cache

restart:
	docker-compose $(DOCKER_COMPOSE_FILE) build --no-cache
	docker-compose $(DOCKER_COMPOSE_FILE) up --build --force-recreate --no-deps -d

clean:
	docker compose $(DOCKER_COMPOSE_FILE) down --volumes
	docker image prune -a

.PHONY: start stop show build clean restart
