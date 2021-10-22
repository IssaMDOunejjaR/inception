# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iounejja <iounejja@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/07/12 16:42:41 by iounejja          #+#    #+#              #
#    Updated: 2021/10/20 11:38:05 by iounejja         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER-COMPOSE-FILE = ./srcs/docker-compose.yml

make: clear build run

build:
	# cd srcs && docker-compose build
	docker build -t nginx ./srcs/requirements/nginx
	docker build -t wordpress ./srcs/requirements/wordpress
	docker build -t mariadb ./srcs/requirements/mariadb
	docker build -t ftp ./srcs/requirements/bonus/ftp
	docker build -t redis ./srcs/requirements/bonus/redis
	docker build -t adminer ./srcs/requirements/bonus/adminer
	docker build -t grafana ./srcs/requirements/bonus/grafana
	docker build -t influxdb ./srcs/requirements/bonus/influxdb

run:
	docker-compose -f $(DOCKER-COMPOSE-FILE) up

clear:
	docker-compose -f $(DOCKER-COMPOSE-FILE) down