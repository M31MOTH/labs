#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

MUTILLIDAE_URL="https://github.com/portantier/labs/blob/master/mutillidae.tar.xz"

apt-get install -y --no-install-recommends \
	libapache2-mod-php5 \
	mysql-server \
	php5-curl \
	php5-mysqlnd \
	xz-utils

wget -O /var/www/html/mutillidae.tar.xz $MUTILLIDAE_URL

cd /var/www/html

tar -xJf mutillidae.tar.xz

rm -f /var/www/html/index.html

service apache2 restart
service mysql restart

curl -s "http://127.0.0.1/mutillidae/set-up-database.php" > /dev/null

