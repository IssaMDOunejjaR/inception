FROM alpine

RUN apk update && apk upgrade
RUN apk add vsftpd openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=issamounejjar"

RUN adduser -D iounejja
RUN echo "iounejja:123456" | chpasswd

COPY ./srcs/vsftpd.conf /etc/vsftpd

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]

EXPOSE 21