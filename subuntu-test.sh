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

sudo apt-get update

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

sudo apt-get update

###############################################################
# Install a list of applications - external
###############################################################

# cairo-dock cairo-dock-plug-ins \
	
LIST_OF_APPS="\
	code \
	google-chrome-stable \
	filezilla \
	skypeforlinux \
	papirus-icon-theme \
	dockbarx xfce4-dockbarx-plugin \
	"
sudo apt-get install -y $LIST_OF_APPS



###############################################################
# Update system
###############################################################

sudo apt-get update


###############################################################
# User Configurations
###############################################################

sudo cp -rfv ./cfg/* ~/.config/
sudo mkdir ./cfg_dockbarx/
sudo cp -rfv ./cfg_dockbarx/* ~/.dockbarx/
sudo cp -rfv ./Templates/* ~/Templates/
sudo cp -rfv ./local_share/* ~/.local/share/
sudo cp -rfv ./etc/* /etc/


###############################################################
# GIT configuration
###############################################################

git config --global user.email "$U_GIT_USER"
git config --global user.name "$U_GIT_NAME"
git config --list


###############################################################
# System information
###############################################################

lsb_release -a

###############################################################

