#!/bin/bash

# Update System
sudo apt update && sudo apt-get upgrade -y

# Install Apache web server
sudo apt install apache2 -y

# Install MySQL database server
sudo apt install mysql-server -y

# Install expect if not already installed
sudo apt-get install -y expect

# Secure MySQL installation
SECURE_MYSQL=$(expect -c "
set timeout 10
spawn sudo mysql_secure_installation
expect \"Enter password for user root:\"
send \"vagrant\r\"
expect \"New password:\"
send \"dbpasswd123\r\"
expect \"Re-enter new password:\"
send \"dbpasswd123\r\"
expect \"Remove anonymous users? (Press y|Y for Yes, any other key for No) :\"
send \"Y\r\"
expect \"Disallow root login remotely? (Press y|Y for Yes, any other key for No) :\"
send \"Y\r\"
expect \"Remove test database and access to it? (Press y|Y for Yes, any other key for No) :\"
send \"Y\r\"
expect \"Reload privilege tables now? (Press y|Y for Yes, any other key for No) :\"
send \"Y\r\"
expect eof
")

echo "$SECURE_MYSQL"

# Install PHP and required modules
sudo apt-get install -y php libapache2-mod-php php-mysql
sudo apt update && sudo apt-get upgrade -y

# Enable mod_rewrite for Apache
sudo a2enmod rewrite

# Restart Apache to load new configuration
sudo systemctl restart apache2

# Clone your PHP application
sudo git clone https://github.com/laravel/laravel /var/www/html/app

# Setup database
mysql -u root -e "CREATE DATABASE appdatab;"
