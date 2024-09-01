FROM debian:buster

RUN apt update -y &&\
	apt upgrade -y &&\
	apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/setup_mysql.sh /etc/mysql/mariadb.conf.d/setup_mysql.sh

RUN chmod +x /etc/mysql/mariadb.conf.d/setup_mysql.sh

EXPOSE 3306

CMD [ "sh", "/etc/mysql/mariadb.conf.d/setup_mysql.sh" ]