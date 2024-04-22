#!/bin/bash

# Configuration variables
DB_PASS="dbpasswd123"
APACHE_ROOT="/var/www/html"
APP_DIR="$APACHE_ROOT/app"
REPO_URL="https://github.com/laravel/laravel"

# Update System
sudo apt update && sudo apt upgrade -y

# Install Apache, MySQL, PHP, and required modules
sudo apt install -y apache2 mysql-server php libapache2-mod-php php-mysql expect

# Secure MySQL installation using expect to automate interactions
SECURE_MYSQL=$(expect -c "
set timeout 10
spawn sudo mysql_secure_installation
expect \"Enter password for user root:\"
send \"vagrant\r\" # Assumed initial password or blank for no password
expect \"New password:\"
send \"$DB_PASS\r\"
expect \"Re-enter new password:\"
send \"$DB_PASS\r\"
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

# Enable mod_rewrite for Apache
sudo a2enmod rewrite

# Restart Apache to apply changes
sudo systemctl restart apache2

# Clone the PHP Laravel application
sudo git clone $REPO_URL $APP_DIR

# Set permissions for the Laravel application directory
sudo chown -R www-data:www-data $APP_DIR
sudo chmod -R 755 $APP_DIR

# Setup database
mysql -u root -p"$DB_PASS" -e "CREATE DATABASE appdatabase;"

# Restart Apache to load new configuration
sudo systemctl restart apache2
