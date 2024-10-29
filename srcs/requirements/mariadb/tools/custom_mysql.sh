#!/bin/bash
set -e

mysqld_safe &

echo "Waiting for MariaDB to start..."
sleep 10

if [ -f /docker-entrypoint-initdb.d/setup_mysql.sh ]; then
    echo "Executing setup_mysql.sh..."
    bash /docker-entrypoint-initdb.d/setup_mysql.sh
fi

wait
