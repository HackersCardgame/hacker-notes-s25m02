#!/bin/bash

# ich an chatgpt: früher ging das ohne fremdes deb-paket, und also ohne wget repo.zabbix....

# System aktualisieren
sudo apt update
sudo apt upgrade

# Zabbix-Server, Web-Frontend, Agent und PostgreSQL-Client installieren
sudo apt install zabbix-server-pgsql zabbix-frontend-php zabbix-apache-conf zabbix-agent postgresql

# PostgreSQL-Datenbank erstellen
sudo -u postgres createuser --pwprompt zabbix
sudo -u postgres createdb -O zabbix zabbix

# Datenbankschema importieren
zcat /usr/share/doc/zabbix-server-pgsql/create.sql.gz | sudo -u postgres psql -d zabbix

# Zabbix-Server-Konfiguration bearbeiten
sudo nano /etc/zabbix/zabbix_server.conf
# DBPassword= (Datenbankpasswort eintragen)

# Dienste starten und aktivieren
sudo systemctl restart zabbix-server zabbix-agent apache2
sudo systemctl enable zabbix-server zabbix-agent apache2


