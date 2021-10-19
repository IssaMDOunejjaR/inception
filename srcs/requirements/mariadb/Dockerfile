FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc mariadb mariadb-client
COPY ./srcs/mariadb-server.cnf /etc/my.cnf.d/
RUN openrc
RUN touch /run/openrc/softlevel
COPY ./srcs/setup.sh /tmp
COPY ./srcs/wordpress.sql /tmp

CMD ["sh", "/tmp/setup.sh"]

EXPOSE 3306 