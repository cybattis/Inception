
DOCKER_COMPOSE_FILE	= -f ./srcs/docker-compose.yml

# Recipe
################################

start:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	docker compose $(DOCKER_COMPOSE_FILE) up -d

stop:
	docker compose $(DOCKER_COMPOSE_FILE) down

show:
	docker compose $(DOCKER_COMPOSE_FILE) ps

build:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	docker compose $(DOCKER_COMPOSE_FILE) build --no-cache

restart: clean build start

clean:
	docker compose $(DOCKER_COMPOSE_FILE) down --volumes
	docker image prune -af
	rm -rf ~/data

fclean: clean
	docker system prune -af

.PHONY: start stop show build clean restart fclean
