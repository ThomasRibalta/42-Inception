FROM debian:buster

RUN apt update -y \
    && apt upgrade -y \
    && apt-get -y install wget

RUN apt-get install -y php7.3 \
                       php-fpm \
                       php-mysql \
                       mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www \
    && cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY conf/auto_config.sh /usr/local/bin/auto_config.sh

RUN chmod +x /usr/local/bin/auto_config.sh

RUN mkdir -p /run/php \
    && chown -R www-data:www-data /run/php

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/bin/bash", "-c", "/usr/local/bin/auto_config.sh & /usr/sbin/php-fpm7.3 -F"]
