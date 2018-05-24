# xubuntu-environment-prep

#### List of applications to install

- GIT (Pre-requirement)
- Visual Studio Code
- Docker + Docker-compose
- Chrome
- Wine
- Filezilla
- Skype
- Meld
- PHP (5.6 or 7.1) + Composer
- Config - Current Apache port (80 => 81) to have 80 port free for Docker
- Config - Hosts (Add needed hosts)


#### How to install

##### Requirements

```
sudo apt-get update && sudo apt-get install -y git
```

##### For Xubuntu 17.04

```
git clone https://github.com/nunoarmando/xubuntu-environment-prep.git naas_x_prep && \
	cd naas_x_prep && \
	sudo sh xubuntu-environment-prep-17.04.sh && \
	xfce4-panel --quit && \
	pkill xfconfd && \
	sudo sh conf.sh && \
	sudo chown -R $USER ~/.config/* && \
	shutdown -r now
```

##### For Xubuntu 18.04

```
git clone https://github.com/nunoarmando/xubuntu-environment-prep.git naas_x_prep && \
	cd naas_x_prep && \
	sudo sh xubuntu-environment-prep-18.04.sh && \
	xfce4-panel --quit && \
	pkill xfconfd && \
	sudo sh conf.sh && \
	sudo chown -R $USER ~/.config/* && \
	shutdown -r now
```

