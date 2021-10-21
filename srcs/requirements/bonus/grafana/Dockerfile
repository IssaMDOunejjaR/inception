FROM alpine:3.13

RUN apk update && apk upgrade
RUN apk add openrc
RUN cd /tmp && wget https://dl.grafana.com/enterprise/release/grafana-enterprise-8.2.2.linux-amd64.tar.gz && tar -zxvf grafana-enterprise-8.2.2.linux-amd64.tar.gz
RUN mkdir /var/www

EXPOSE 3000