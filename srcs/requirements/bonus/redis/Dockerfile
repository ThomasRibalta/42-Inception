FROM debian:buster

RUN apt-get update && \
    apt-get install -y redis-server redis-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/redis.conf /etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server", "/etc/redis/redis.conf"]

