#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

MUTILLIDAE_URL="https://sourceforge.net/projects/mutillidae/files/latest/download?source=typ_redirect"

apt-get install -y --no-install-recommends \
	libapache2-mod-php5 \
	mysql-server \
	php5-curl \
	php5-mysqlnd \
	xz-utils

wget -O /tmp/mutillidae.tar.xz $MUTILLIDAE_URL

tar -xJf /tmp/mutillidae.tar.xz -d /var/www/html/

rm -f /var/www/html/index.html

service apache2 restart
service mysql restart

curl -s "http://127.0.0.1/mutillidae/set-up-database.php" > /dev/null

