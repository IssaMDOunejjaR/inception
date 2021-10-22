#! /bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ];
then
	/etc/init.d/mariadb setup
	service mariadb start

	mysql -u root -e "CREATE USER 'iounejja'@'%' IDENTIFIED BY '123456';"
	mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'iounejja'@'%';"
	mysql -u root -e "CREATE DATABASE wordpress;"
	mysql -u root -e "GRANT ALL ON wordpress.* TO 'iounejja'@'%';"
	mysql -u root -e "FLUSH PRIVILEGES;"
	mysql -u root -D wordpress < /tmp/wordpress.sql

	service mariadb stop
fi