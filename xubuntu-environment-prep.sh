#!/bin/sh

###############################################################
# Update system
###############################################################

sudo apt-get clean
sudo apt-get autoclean
sudo apt-get update


###############################################################
# Install a list of applications - system
###############################################################

LIST_OF_APPS_SYSTEM="apt-transport-https ca-certificates curl gnupg2 software-properties-common"
sudo apt-get install -y $LIST_OF_APPS_SYSTEM


###############################################################
# Add a list of repositories
###############################################################

# Visual Studio Code

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Wine

# sudo dpkg --add-architecture i386 # it is enabled already => we can check it with "dpkg --print-foreign-architectures"
wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/

# Docker

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" # ok for debian, but not ok for ubuntu - CODENAME needed!!
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(dpkg --status tzdata|grep Provides|cut -f2 -d'-') stable"

# PHP

sudo add-apt-repository -y ppa:ondrej/php

# Chrome

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'




###############################################################
# Update system
###############################################################

# sudo apt-get -f install
# sudo apt-get clean
# sudo apt-get autoclean

sudo apt-get update
# sudo apt-get upgrade
# sudo apt-get autoremove


###############################################################
# Install a list of applications - external
###############################################################

LIST_OF_APPS="cairo-dock code docker-ce docker-compose google-chrome-stable winehq-stable"
sudo apt-get install -y $LIST_OF_APPS

# Extra settings for the applications
USER_TO_DOCKER=nuno
sudo usermod -aG docker $USER_TO_DOCKER


###############################################################
# Other applications install
###############################################################

# PHP

sudo apt-get purge -y `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`

# LIST_OF_EXTENSIONS="xml mcrypt mysql gd json mbstring pdo-mysql mysqli zip intl soap"
LIST_OF_EXTENSIONS="xml mcrypt gd mbstring pdo-mysql mysqli zip"
#PHP_VERSION="5.6"
PHP_VERSION="7.2"
sudo apt-get install -y php$PHP_VERSION
sudo apt-get install -y php$PHP_VERSION-$LIST_OF_EXTENSIONS

# PHP - Composer

sudo curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer



###############################################################
# Other configurations
###############################################################

# Changing local Apache default port 80 => 81 (/etc/apache2/ports.conf ; /etc/apache2/sites-enabled/000-default.conf)

sudo sed -i 's/Listen 80/Listen 81/' /etc/apache2/ports.conf
sudo sed -i 's/Listen 80/Listen 81/' /etc/apache2/sites-enabled/000-default.conf # for existing sites
sudo service apache2 restart


# Adding hosts (/etc/hosts)

sudo sed -i 's/localhost/localhost\
\
127.0.0.1	\t	dv \
\
127.0.0.1	\t	platform.dev.eu \
127.0.0.1	\t	dpo.dev.eu \
127.0.0.1	\t	admin.dev.eu \
127.0.0.1	\t	www.dev.eu \
127.0.0.1	\t	subscribe.dev.eu \
127.0.0.1	\t	api.dev.eu \
127.0.0.1	\t	my.dev.eu \
/' /etc/hosts

###############################################################
# User Configurations (~/.config/)
###############################################################

# Autostart

cp ./cfg/autostart/ ~/.config/autostart/

# Cairo-dock

cp ./cfg/cairo/ ~/.config/cairo-dock/

# File manager shortcuts

cp ./cfg/gtk-3.0/ ~/.config/gtk-3.0/


###############################################################
# GIT projects - clone
###############################################################



###############################################################



