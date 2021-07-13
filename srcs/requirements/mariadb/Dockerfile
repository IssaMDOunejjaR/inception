FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc mariadb mariadb-client
RUN openrc
RUN touch /run/openrc/softlevel
RUN /etc/init.d/mariadb setup