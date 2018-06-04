#!/bin/sh

###############################################################
# User variables
###############################################################

U_USER="joao"

###############################################################
# Update system
###############################################################

sudo apt-get clean && sudo apt-get autoclean && sudo apt autoremove -y && sudo apt-get update


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

# Wine

# sudo dpkg --add-architecture i386 # it is enabled already => we can check it with "dpkg --print-foreign-architectures"
wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
# wine repository fix
sudo sed -i 's/wine-builds\/ubuntu\/ bionic/wine-builds\/ubuntu\/ artful/' /etc/apt/sources.list

# Dockbarx

sudo add-apt-repository -y ppa:xuzhen666/dockbarx


###############################################################
# Update system
###############################################################

sudo apt-get clean && sudo apt-get autoclean && sudo apt autoremove -y && sudo apt-get update

###############################################################
# Install a list of applications - external
###############################################################

LIST_OF_APPS="\
	winehq-stable winetricks \
	papirus-icon-theme \
	dockbarx xfce4-dockbarx-plugin \
	"
sudo apt-get install -y $LIST_OF_APPS


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
