# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iounejja <iounejja@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/07/12 16:42:41 by iounejja          #+#    #+#              #
#    Updated: 2021/07/12 16:47:25 by iounejja         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER-COMPOSE-FILE = ./srcs/docker-compose.yml

build:
	docker build -t nginx ./srcs/requirements/nginx
	docker build -t wordpress ./srcs/requirements/wordpress
	docker build -t mariadb ./srcs/requirements/mariadb

run:
	docker-compose -f $(DOCKER-COMPOSE-FILE) up

clear:
	docker-compose -f $(DOCKER-COMPOSE-FILE) down