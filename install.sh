#!/bin/bash

apt install apache2 mariadb-server libapache2-mod-php
apt install php-gd php-json php-mysql php-curl php-mbstring php-intl php-imagick php-xml php-zip
apt install php7.3-curl php7.3-zip php7.3-gd php7.3-xml php7.3-mbstring php7.3-intl
service apache2 restart

cd /var/www
wget https://download.nextcloud.com/server/releases/latest.zip
rm latest.zip
chmod -R 750 nextcloud
chown -R 33:33 nextcloud

mysql -e "CREATE USER 'nextcloud' IDENTIFIED BY 'password';"
mysql -e "CREATE DATABASE nextcloud;"
mysql -e "GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@localhost IDENTIFIED BY 'password';"
mysql -e "FLUSH PRIVILEGES;"
