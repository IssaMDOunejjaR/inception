#! /bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ];
then
	/etc/init.d/mariadb setup
	service mariadb start

	mysql -u root -e "CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PASSORD}';"
	mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_USER}'@'%';"
	mysql -u root -e "CREATE DATABASE ${WORDPRESS_DATABASE_NAME};"
	mysql -u root -e "GRANT ALL ON ${WORDPRESS_DATABASE_NAME}.* TO '${MARIADB_USER}'@'%';"
	mysql -u root -e "FLUSH PRIVILEGES;"
	mysql -u root -D $WORDPRESS_DATABASE_NAME < /tmp/wordpress.sql

	service mariadb stop
fi