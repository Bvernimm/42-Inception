NAME		= inception


$(NAME):
	docker-compose -f ./srcs/docker-compose.yml up -d --build

all: $(NAME)

stop:
	docker-compose -f  ./srcs/docker-compose.yml  stop

down:
	docker-compose -f  ./srcs/docker-compose.yml  down -v

re: down all

.PHONY: all stop down re
