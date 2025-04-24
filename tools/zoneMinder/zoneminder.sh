#!/bin/bash

exit # not working yet

adduser --system --no-create-home --group zoneminder
vim /usr .... /zoneminder.service
    User=zoneminder

chown -R zoneminder: /var/cache/zoneminder /var/log/zm (/etc/zm)

sudo apt install zoneminder
sudo a2enconf zoneminder
sudo systemctl reload apache2
sudo systemctl status zoneminder
sudo systemctl enable zoneminder
sudo systemctl start zoneminder
sudo systemctl status apache2
sudo systemctl start apache2
sudo apt install php php-mysql libapache2-mod-php
sudo a2enmod php8.2   # Oder welche Version du hast
sudo systemctl restart apache2
sudo tail -n 50 /var/log/apache2/error.log
sudo tail -n 50 /var/log/zm/zm*.log
sudo nano /etc/php/*/apache2/php.ini
     display_errors = On
     error_reporting = E_ALL
sudo systemctl restart apache2
mysql -u zmuser -p
sudo cat /etc/zm/zm.conf
sudo tail -n 50 /var/log/apache2/error.log
sudo tail -n 50 /var/log/zm/zm*.log

sudo apt install php-mysql php-gd php-cli php-cgi php-xml php-mbstring

sudo apt install mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb

sudo mysql -u root -p

CREATE DATABASE zm;
CREATE USER zmuser;
GRANT ALL PRIVILEGES ON zm.* TO 'zmuser'@'localhost' IDENTIFIED BY 'zmpass';
FLUSH PRIVILEGES;
EXIT;

sudo nano /etc/zm/zm.conf


ZM_DB_NAME=zm
ZM_DB_USER=zmuser
ZM_DB_PASS=zmpass


sudo mysql -u zmuser -p zm < /usr/share/zoneminder/db/zm_create.sql

sudo systemctl restart zoneminder
sudo systemctl restart apache2

/usr/share/zoneminder/db/zm_create.sql

sudo mysql -u zmuser -p zm < /usr/share/zoneminder/db/zm_create.sql

/usr/share/zoneminder/mysql/create_db.sh



#!/bin/bash
DBNAME=zm
DBUSER=zmuser
DBPASS=zmpass

mysql -u root -p <<EOF
CREATE DATABASE IF NOT EXISTS $DBNAME;
GRANT ALL PRIVILEGES ON $DBNAME.* TO '$DBUSER'@'localhost' IDENTIFIED BY '$DBPASS';
FLUSH PRIVILEGES;
EOF

mysql -u $DBUSER -p$DBPASS $DBNAME < /usr/share/zoneminder/db/zm_create.sql





