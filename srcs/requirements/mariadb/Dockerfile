FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc mariadb mariadb-client
COPY ./srcs/mariadb-server.cnf /etc/my.cnf.d/
RUN openrc
RUN touch /run/openrc/softlevel
RUN /etc/init.d/mariadb setup
# RUN mkdir /run/mysqld
COPY ./srcs/setup.sh /tmp

# CMD ["/usr/bin/mysqld", "--basedir=/usr", "--datadir=/var/lib/mysql", "--plugin-dir=/usr/lib/mariadb/plugin", "--user=root", "--pid-file=/run/mysqld/mariadb.pid"]
# CMD /etc/init.d/mariadb setup && /usr/bin/mysqld --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=root --pid-file=/run/mysqld/mariadb.pid
CMD ["sh", "/tmp/setup.sh"]

EXPOSE 3306