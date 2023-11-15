NAME	:= wordpress
DOCKER	:= docker
DC		:= docker-compose

.phony: all clean fclean re softre

all: $(NAME)

$(NAME):
	cd srcs && $(DC) up -d
clean:
	cd srcs && $(DC) down
fclean: clean
	cd srcs && $(DC) down -v
	$(DOCKER) system prune -a -f
re: fclean all
softre: clean all