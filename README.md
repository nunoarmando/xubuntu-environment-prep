# xubuntu-environment-prep

#### List of applications to install

- GIT
- Cairo-dock
- Visual Studio Code
- Docker + Docker-compose
- Chrome
- Wine
- Filezilla
- Skype
- PHP (5.6 or 7.1) + Composer
- Config - Current Apache port (80 => 81) to have 80 port free for docker
- Config - Hosts (Add needed hosts)

#### List of applications to remove

- pidgin
- gnome-mines
- gnome-sudoku
- sgt-puzzles
- xfce4-appfinder
- xfce4-notes
- xfce4-screenshooter
- onboard
- orage
- libreoffice-math
- catfish
- thunderbird
- transmission-gtk
- transmission-common


#### How to install

##### Requirements

```
sudo apt-get update && sudo apt-get install -y git
```

##### For Xubuntu 17.04

```
git clone https://github.com/nunoarmando/xubuntu-environment-prep.git naas_x_prep && cd naas_x_prep && sudo sh xubuntu-environment-prep.17.04.sh
```

##### For Xubuntu 18.04

```
git clone https://github.com/nunoarmando/xubuntu-environment-prep.git naas_x_prep && cd naas_x_prep && sudo sh xubuntu-environment-prep.18.04.sh
```

