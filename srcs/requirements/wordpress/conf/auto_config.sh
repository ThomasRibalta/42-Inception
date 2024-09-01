#!/bin/bash
sleep 10

WORDPRESS_PATH='/var/www/wordpress'

cd $WORDPRESS_PATH

if [ ! -f "wp-config.php" ]; then
    echo "Creating wp-config.php file..."
    
    wp config create --allow-root \
                     --dbname=$MYSQL_DATABASE \
                     --dbuser=$MYSQL_USER \
                     --dbpass=$MYSQL_PASSWORD \
                     --dbhost=mariadb:3306

    echo "wp-config.php file created successfully."

    wp core install --allow-root \
                    --url="http://$DOMAIN_NAME" \
                    --title="$WP_TITLE" \
                    --admin_user="$WP_ADMIN_USER" \
                    --admin_password="$WP_ADMIN_PASSWORD" \
                    --admin_email="$WP_ADMIN_EMAIL"

    echo "WordPress installed successfully."

    wp user create --allow-root \
                   $WP_USER \
                   $WP_USER_EMAIL \
                   --role=editor \
                   --user_pass=$WP_USER_PASSWORD

    echo "Second WordPress user created successfully."

    echo "Configuring Redis..."
    wp config set WP_REDIS_HOST redis --allow-root 
    wp config set WP_REDIS_PORT 6379 --raw --allow-root
    wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
    wp config set WP_REDIS_CLIENT phpredis --allow-root
    wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
    wp redis enable --allow-root
else
    echo "wp-config.php already exists. Skipping configuration."
fi

if [ ! -d "/run/php" ]; then
    mkdir -p /run/php
    echo "Created /run/php directory."
fis 