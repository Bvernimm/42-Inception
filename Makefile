# NAME		= inception


# $(NAME):
# 	docker-compose -f ./srcs/docker-compose.yml up -d --build

# all: $(NAME)

# stop:
# 	docker-compose -f  ./srcs/docker-compose.yml  stop

# down:
# 	docker-compose -f  ./srcs/docker-compose.yml  down -v

# re: down all

# .PHONY: all stop down re

all: 
	@mkdir -p ~/data
	@mkdir -p ~/data/mariadb
	@mkdir -p ~/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f srcs/docker-compose.yml up --build

clean:
	@sudo rm -rf ~/data
	@docker stop $$(docker ps -qa);
	@docker rm $$(docker ps -qa);
	@docker rmi -f $$(docker images -qa);
	@docker volume rm $$(docker volume ls -q);
	@docker network rm $$(docker network ls -q);
	

.PHONY: all re down clean