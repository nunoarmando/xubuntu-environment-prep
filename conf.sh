###############################################################
# User Configurations
###############################################################

sleep 1
echo '############## 5 #######################'
sleep 1
echo '############## 4 #######################'
sleep 1
echo '############## 3 #######################'
sleep 1
echo '############## 2 #######################'
sleep 1
echo '############## 1 #######################'
sleep 1

xfce4-panel --quit && pkill xfconfd

sudo cp -rfv ./cfg/* ~/.config/
sudo mkdir ./cfg_dockbarx/
sudo cp -rfv ./cfg_dockbarx/* ~/.dockbarx/
sudo cp -rfv ./Templates/* ~/Templates/
sudo cp -rfv ./Pictures/* ~/Pictures/
sudo cp -rfv ./local_share/* ~/.local/share/
sudo cp -rfv ./etc/* /etc/

#xfce4-panel

