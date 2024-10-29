all:
	@sudo apt-get -y install hostsed
	@sudo hostsed add 127.0.0.1 thoribal.42.fr && echo "\033[1;32m~|ADD thoribal.42.fr to /etc/hosts|~\033[0m"
	@mkdir -p /home/thoribal/data/mariadb
	@mkdir -p /home/thoribal/data/wordpress
	@sudo docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@sudo hostsed rm 127.0.0.1 thoribal.42.fr && echo "\033[1;31m~|DELETE thoribal.42.fr from /etc/hosts|~\033[0m"
	@sudo docker compose -f ./srcs/docker-compose.yml down

re:
	@sudo docker compose -f srcs/docker-compose.yml up -d --build

clean:
	@rm -rf /home/thoribal/data/mariadb
	@rm -rf /home/thoribal/data/wordpress
	@sudo docker stop $$(docker ps -qa);\
	sudo docker rm $$(docker ps -qa);\
	sudo docker rmi -f $$(docker images -qa);\
	sudo docker volume rm $$(docker volume ls -q);\
	sudo docker network rm $$(docker network ls -q);\

.PHONY: all re down clean
