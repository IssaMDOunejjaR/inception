#! /bin/sh

while [ 1 ]
do
	pgrep php-fpm7 > /dev/null
	if [ $? != 0 ]; then
		echo "php-fpm7 is not runnig !"
		/usr/sbin/php-fpm7 -F &
	else
		echo "php-fpm7 is runnig !"
	fi
	sleep 2
done