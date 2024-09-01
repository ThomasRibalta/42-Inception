FROM debian:buster

RUN apt-get update && apt-get install -y vsftpd

RUN mkdir -p /var/run/vsftpd/empty

COPY conf/vsftpd.conf /etc/vsftpd.conf

RUN useradd -m ftpuser && echo "ftpuser:ftppassword" | chpasswd

RUN mkdir -p /var/www/wordpress && chown -R ftpuser:ftpuser /var/www/wordpress

EXPOSE 21

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
