FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc nginx openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=Khouribga/L=Khouribga/O=1337/CN=issamounejjar"
COPY srcs/nginx.conf /etc/nginx/
RUN rm -rf /etc/nginx/http.d/default.conf
RUN openrc
RUN touch /run/openrc/softlevel

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 443