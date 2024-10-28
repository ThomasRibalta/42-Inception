#!/bin/bash
set -e

# Démarrer MariaDB en arrière-plan
mysqld_safe &

# Attendre que MariaDB soit opérationnel
echo "Waiting for MariaDB to start..."
sleep 10

# Exécuter le script d'initialisation
if [ -f /docker-entrypoint-initdb.d/setup_mysql.sh ]; then
    echo "Executing setup_mysql.sh..."
    bash /docker-entrypoint-initdb.d/setup_mysql.sh
fi

# Garder le processus principal en cours d'exécution
wait
