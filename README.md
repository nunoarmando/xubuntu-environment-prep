# xubuntu-environment-prep

#### List of applications to install

- GIT
- Cairo-dock
- Visual Studio Code
- Docker + Docker-compose
- Chrome
- Wine
- PHP (5.6 or 7.2) + Composer
- Config - Current Apache port (80 => 81) to have 80 port free for docker
- Config - Hosts (Add needed hosts)

#### How to install

```
sudo apt-get update
sudo apt-get install -y git

git clone https://github.com/nunoarmando/xubuntu-environment-prep.git naas_x_prep
cd naas_x_prep
chmod -x xubuntu-environment-prep.sh
sudo sh xubuntu-environment-prep.sh
```

