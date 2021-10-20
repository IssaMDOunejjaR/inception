FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc redis

CMD ["/usr/bin/redis-server"]

EXPOSE 6379