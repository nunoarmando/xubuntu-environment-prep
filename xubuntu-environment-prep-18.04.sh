#!/bin/sh

###############################################################
# User variables
###############################################################

U_USER="nuno"
U_GIT_USER="nunoarmando@gmail.com"
U_GIT_NAME="Nuno Serrano"


###############################################################
# Update system
###############################################################

sudo apt-get clean && sudo apt-get autoclean && sudo apt autoremove -y && sudo apt-get update


###############################################################
# Release upgrade
###############################################################

sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y

sudo do-release-upgrade -c && sudo do-release-upgrade -f DistUpgradeViewNonInteractive


###############################################################
# Update system
###############################################################

sudo apt-get clean && sudo apt-get autoclean && sudo apt-get update


###############################################################
# Install a list of applications - system
###############################################################

LIST_OF_APPS_SYSTEM="\
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg2 \
	software-properties-common \
	"
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
# wine repository fix
sudo sed -i 's/wine-builds\/ubuntu\/ bionic/wine-builds\/ubuntu\/ artful/' /etc/apt/sources.list

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

# Skype

curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
echo "deb https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skypeforlinux.list

# Dockbarx

sudo add-apt-repository ppa:xuzhen666/dockbarx -y


###############################################################
# Update system
###############################################################

sudo apt-get clean && sudo apt-get autoclean && sudo apt autoremove -y && sudo apt-get update

###############################################################
# Install a list of applications - external
###############################################################

# cairo-dock cairo-dock-plug-ins \
	
LIST_OF_APPS="\
	code \
	docker-ce \
	docker-compose \
	google-chrome-stable \
	winehq-stable \
	filezilla \
	skypeforlinux \
	papirus-icon-theme \
	dockbarx xfce4-dockbarx-plugin \
	"
sudo apt-get install -y $LIST_OF_APPS

# Extra settings for the applications
sudo usermod -aG docker $U_USER


###############################################################
# Install other applications
###############################################################

# PHP

sudo apt-get purge -y `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`

#PHP_VERSION="php5.6"
PHP_VERSION="php7.1"
sudo apt-get install -y \
	$PHP_VERSION \
	$PHP_VERSION-xml \
	$PHP_VERSION-mcrypt \
	$PHP_VERSION-mysql \
	$PHP_VERSION-gd \
	$PHP_VERSION-json \
	$PHP_VERSION-mbstring \
	$PHP_VERSION-pdo-mysql \
	$PHP_VERSION-mysqli \
	$PHP_VERSION-zip \
	$PHP_VERSION-intl \
	$PHP_VERSION-soap

# PHP - Composer

sudo curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


###############################################################
# Update system
###############################################################

#sudo apt-get clean && sudo apt-get autoclean && sudo apt autoremove -y && sudo apt-get update
sudo apt-get update


###############################################################
# Remove system applications - 17.04
###############################################################

# LIST_OF_APPS_TO_REMOVE="\
# 	pidgin \
# 	gnome-mines gnome-sudoku sgt-puzzles \
# 	xfce4-appfinder xfce4-notes xfce4-screenshooter \
# 	onboard \
# 	orage \
# 	libreoffice-math \
# 	catfish \
# 	thunderbird \
# 	transmission-gtk \
# 	transmission-common\
# 	"
# sudo apt-get remove -y $LIST_OF_APPS_TO_REMOVE


###############################################################
# Remove system applications - 18.04
###############################################################

# LIST_OF_APPS_TO_REMOVE="\
# 	gnote \
# 	"
# sudo apt-get remove -y $LIST_OF_APPS_TO_REMOVE


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
# User Configurations
###############################################################

sudo cp -rfv ./cfg/ ~/.config/
sudo cp -rfv ./cfg_dockbarx/ ~/.dockbarx/
sudo cp -rfv ./Templates/ ~/Templates/

###############################################################
# GIT configuration
###############################################################

git config --global user.email "$U_GIT_USER"
git config --global user.name "$U_GIT_NAME"
git config --list


###############################################################
# Clean system
###############################################################

sudo apt-get -y clean && sudo apt-get -y autoclean && sudo apt-get -y autoremove
sudo du -sh /var/cache/apt
sudo apt-get clean
sudo du -sh /var/cache/apt

###############################################################
# System information
###############################################################

lsb_release -a

###############################################################

