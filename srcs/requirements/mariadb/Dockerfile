FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server \
    mariadb-client \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY tools/setup_mysql.sh /usr/local/bin/setup_mysql.sh

RUN chmod +x /usr/local/bin/setup_mysql.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/setup_mysql.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]