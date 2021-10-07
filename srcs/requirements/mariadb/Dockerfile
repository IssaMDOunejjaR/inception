FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc mariadb mariadb-client
RUN openrc
RUN touch /run/openrc/softlevel
RUN /etc/init.d/mariadb setup
RUN mkdir /run/mysqld

CMD ["/usr/bin/mysqld", "--basedir=/usr", "--datadir=/var/lib/mysql", "--plugin-dir=/usr/lib/mariadb/plugin", "--user=root", "--pid-file=/run/mysqld/mariadb.pid"]

EXPOSE 3306