# Utiliser l'image de base Debian Bullseye
FROM debian:bullseye

# Mettre à jour le système et installer les dépendances
RUN apt-get update && \
    apt-get install -y \
    mariadb-server \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Créer le répertoire pour le socket et donner les bonnes permissions
RUN mkdir -p /run/mysqld && \
    chown mysql:mysql /run/mysqld

# Copier le fichier de configuration de MariaDB
COPY conf/50-server.cnf /etc/mysql/my.cnf

COPY tools/custom_mysql.sh /custom_mysql.sh
RUN chmod +x /custom_mysql.sh

COPY tools/setup_mysql.sh /docker-entrypoint-initdb.d/setup_mysql.sh
RUN chmod +x /docker-entrypoint-initdb.d/setup_mysql.sh

# Exposer le port par défaut de MariaDB
EXPOSE 3306

# Commande par défaut pour démarrer MariaDB
ENTRYPOINT [ "/custom_mysql.sh" ]
