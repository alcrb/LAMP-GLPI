#!/bin/bash

# Faire les MAJ
apt update -y && apt upgrade -y
# Install ssh
apt install ssh openssh-server -y
# Install programmes
apt install mc locate fish expect -y
# Install sources
apt install software-properties-common -y
add-apt-repository contrib 
add-apt-repository non-free
add-apt-repository non-free-firmware
# MAJ sources
apt update
# Install apache
apt install apache2 -y
systemctl enable apache2.service
# Install php
apt install php libapache2-mod-php -y
# Install extensions php
apt install php-ldap php-imap php-apcu php-xmlrpc php-cas php-mysqli php-mbstring php-curl php-gd php-simplexml php-xml php-intl php-zip php-bz2 -y
# Supprimer les fichiers inutiles index.html et index.php
rm /var/www/html/*
# Installer MariaDB
apt install mariadb-server -y 
systemctl enable mariadb.service


#Lancer & répondre automatiquement au script de sécurité
SECURE_MYSQL=$(expect -c "
set timeout 10
spawn mysql_secure_installation

expect \"Enter current password for root (enter for none):\"
send \"\r\"

expect \"Switch to unix_socket authentication\"
send \"Y\r\"

expect \"Change the root password?\"
send \"\r\"

expect \"Remove anonymous users?\"
send \"Y\r\"

expect \"Disallow root login remotely?\"
send \"Y\r\"

expect \"Remove test database and access to it?\"
send \"Y\r\"

expect \"Reload privilege tables now?\"
send \"Y\r\"

expect eof
")

echo "$SECURE_MYSQL"

# Entrer dans la console de MariaDB,Créer une base de données MariaDB & Donner les droits tout en créant l'utilisateur
mysql -u root -e "create database db_glpi; grant all privileges on db_glpi.* To GLPI_admin@localhost identified by 'YourPassword';"

# MAJ système
apt update && apt full-upgrade
# Modifier le fichier 000-default.conf pour sécurisation
CONF_FILE="/etc/apache2/sites-available/000-default.conf"
NEW_CONF="
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/glpi
    <Directory /var/www/html>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
"
# Remplacer le contenu du fichier
echo "$NEW_CONF" | tee "$CONF_FILE" > /dev/null
# Redémarrer Apache
systemctl restart apache2

# Télécharger GLPI
cd /tmp/
wget github.com/glpi-project/glpi/releases/download/10.0.6/glpi-10.0.6.tgz
# Décompressez dans var/www/html
tar xvzf glpi-10.0.6.tgz -C /var/www/html
# Changer les permissions sur le dossier de GLPI afin qu’Apache puisse y accéder
chown -R www-data:www-data /var/www/html/glpi
chmod -R 775 /var/www/html/glpi

# Télécharger plugin FusionInventory (Depuis GLPI 10 l'inventaire est intégré)
# wget https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi10.0.6%2B1.1/fusioninventory-10.0.6+1.1.tar.bz2
# tar xvjf fusioninventory-10.0.6+1.1.tar.bz2 -C /var/www/html/glpi/plugins
# chown -R www-data /var/www/html/glpi/plugins

# Supprimer fichier install.php de glpi (le faire manuellement après l'installation graphique de GLPI)
# rm /var/www/html/glpi/install/install.php
