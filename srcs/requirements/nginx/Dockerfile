FROM debian:buster

RUN apt update && \
    apt install -y nginx vim openssl

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/thoribal.crt \
        -keyout /etc/nginx/ssl/thoribal.key \
        -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=student/CN=thoribal/"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]