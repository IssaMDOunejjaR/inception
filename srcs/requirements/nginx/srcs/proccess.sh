#! /bin/sh

while [ 1 ]
do
	pgrep nginx > /dev/null
	if [ $? != 0 ]; then
		echo "nginx is not runnig !"
		nginx -g 'daemon off;' &
	else
		echo "nginx is runnig !"
	fi
	sleep 2
done