FROM alpine

RUN apk update && apk upgrade
RUN apk add redis
COPY ./srcs/redis.conf /etc/

CMD ["/usr/bin/redis-server", "/etc/redis.conf"]

EXPOSE 6379