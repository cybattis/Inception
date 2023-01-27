HOME	=	/home/cybattis
DOCKER_COMPOSE_FILE	=	-f ./srcs/docker-compose.yml

# Recipe
################################

start:
	mkdir -p $(HOME)/data/wordpress
	mkdir -p $(HOME)/data/mariadb
	docker compose $(DOCKER_COMPOSE_FILE) up -d

stop:
	docker compose $(DOCKER_COMPOSE_FILE) down

show:
	docker compose $(DOCKER_COMPOSE_FILE) ps

build:
	mkdir -p $(HOME)/data/wordpress
	mkdir -p $(HOME)/data/mariadb
	docker compose $(DOCKER_COMPOSE_FILE) build --no-cache

restart: clean build start

clean:
	docker compose $(DOCKER_COMPOSE_FILE) down --volumes
	docker image rm srcs-nginx srcs-mariadb srcs-wordpress
	rm -rf $(HOME)/data

fclean: clean
	docker system prune -af

reset:
	docker stop $(docker ps -qa);
	docker rm $(docker ps -qa);
	docker rmi -f $(docker images -qa);
	docker volume rm $(docker volume ls -q);

.PHONY: start stop show build clean restart fclean reset
