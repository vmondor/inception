all:
	mkdir -p /home/vmondor/data/mariadb
	mkdir -p /home/vmondor/data/wordpress
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

logs:
	@echo "\n\n---------- NGINX ----------\n"
	docker logs nginx
	@echo "\n\n---------- MARIADB ----------\n"
	docker logs mariadb
	@echo "\n\n---------- WORDPRESS ----------\n"
	docker logs wordpress

restart:
	docker compose -f ./srcs/docker-compose.yml down
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d
	
clean:
	docker stop nginx mariadb wordpress
	docker network rm inception

fclean: clean
	@sudo rm -rf /home/vmondor/data/mariadb/*
	@sudo rm -rf /home/vmondor/data/wordpress/*
	@docker system prune -af

re: fclean all

.Phony: all logs restart clean fclean