YML_FILE= ./srcs/docker-compose.yml

all: run

run:
	@echo "Building files for volumes ..."
	sudo mkdir -p /home/tchantro/data/wordpress
	sudo mkdir -p /home/tchantro/data/mysql
	@echo "Building containers ..."
	docker compose -f $(YML_FILE) up --build

stop:
	@echo "Stopping containers ..."
	docker-compose -f $(YML_FILE) stop

clean: stop
	@echo "Deleting all container ..."
	docker system prune -f
	@-docker volume rm `docker volume ls -q`
	@-docker image rmi `docker image ls -q`
	@echo "Deleting all data ..."
	sudo rm -rf /home/tchantro/data/wordpress
	sudo rm -rf /home/tchantro/data/mysql
	@echo "Deleting success !"

.PHONY: run stop clean
