#!/bin/bash
sleep 10

WORDPRESS_PATH='/var/www/wordpress'

if [ ! -f "$WORDPRESS_PATH/wp-config.php" ]; then
    echo "Creating wp-config.php file..."
    
    wp config create --allow-root \
                     --dbname=$MYSQL_DATABASE \
                     --dbuser=$MYSQL_USER \
                     --dbpass=$MYSQL_PASSWORD \
                     --dbhost=mariadb:3306 \
                     --path=$WORDPRESS_PATH

    echo "wp-config.php file created successfully."

    wp core install --allow-root \
                    --url="http://$DOMAIN_NAME" \
                    --title="$WP_TITLE" \
                    --admin_user="$WP_ADMIN_USER" \
                    --admin_password="$WP_ADMIN_PASSWORD" \
                    --admin_email="$WP_ADMIN_EMAIL" \
                    --path=$WORDPRESS_PATH

    echo "WordPress installed successfully."

    wp user create --allow-root \
                   $WP_USER \
                   $WP_USER_EMAIL \
                   --role=editor \
                   --user_pass=$WP_USER_PASSWORD \
                   --path=$WORDPRESS_PATH

    echo "Second WordPress user created successfully."
else
    echo "wp-config.php already exists. Skipping configuration."
fi

if [ ! -d "/run/php" ]; then
    mkdir -p /run/php
    echo "Created /run/php directory."
fi

