FROM debian:bullseye

RUN apt update -y \
    && apt upgrade -y \
    && apt-get -y install wget \
    && apt-get install -y php7.4 php7.4-fpm php7.4-mysql php7.4-gd php7.4-xml php7.4-curl php7.4-mbstring php7.4-zip mariadb-client php-redis ftp \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www \
    && cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY conf/auto_config.sh /usr/local/bin/auto_config.sh

RUN chmod +x /usr/local/bin/auto_config.sh

RUN mkdir -p /run/php \
    && chown -R www-data:www-data /run/php

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/bin/bash", "-c", "/usr/local/bin/auto_config.sh & /usr/sbin/php-fpm7.4 -F"]
