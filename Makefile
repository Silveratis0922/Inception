YML_FILE= ./srcs/docker-compose.yml

all: run

run:
	@echo "Building files for volumes ..."
	@sudo mkdir -p /home/tchantro/data/wordpress
	@sudo mkdir -p /home/tchantro/data/mysql
	@echo "Building containers ..."
	@docker-compose -f $(YML_FILE) up --build

up:
	@echo "Building files for volumes ..."
	@sudo mkdir -p /home/tchantro/data/wordpress
	@sudo mkdir -p /home/tchantro/data/mysql
	@echo "Building containers in background ..."
	@docker-compose -f $(YML_FILE) up -d --build

debug:
	@echo "Building files for volumes ..."
	@sudo mkdir -p /home/tchantro/data/wordpress
	@sudo mkdir -p /home/tchantro/data/mysql
	@echo "Building containers with log information ..."
	@docker-compose -f $(YML_FILE) --verbose up

list:
	@echo "Listing all containers ..."
	docker ps -a

volumes:
	@echo "Listing volumes ..."
	docker volume -a

clean:
	@echo "Stopping containers ..."
	@docker-compose -f $(YML_FILE) down
	@-docker stop `docker ps -qa`
	@-docker rm `docker ps -qa`
	@echo "Deleting all images ..."
	@-docker volume rm `docker volume ls -q`
	@echo "Deleting all network ..."
	@-docker network rm `docker network ls -q`
	@echo "Deleting all data ..."
	@sudo rm -rf /home/tchantro/data/wordpress
	@sudo rm -rf /home/tchantro/data/mysql
	@echo "Deleting all"

.PHONY: run up debug list volumes clean
