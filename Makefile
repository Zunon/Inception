NAME	:= wordpress
DOCKER	:= docker
DC		:= docker-compose

.phony: all clean fclean re

$(NAME):
	cd srcs && $(DC) up -d
clean:
	cd srcs && $(DC) down
fclean: clean
	cd srcs && $(DC) down -v
re: fclean all