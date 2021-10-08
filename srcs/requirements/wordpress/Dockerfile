FROM alpine

RUN apk update && apk upgrade
RUN apk add wget openrc php-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN cd /tmp/ && wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz
COPY ./srcs /etc/php7/php-fpm.d/
RUN openrc
RUN touch /run/openrc/softlevel

CMD if [ ! -d /var/www/wordpress ]; then cp -r /tmp/wordpress /var/www; fi && /usr/sbin/php-fpm7 -F

EXPOSE 9000