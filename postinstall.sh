#!/bin/bash

echo "initial full upgrade"
sudo apt update
sudo apt full-upgrade -y

echo "install google chrome.."

wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt install google-chrome-stable -y

echo "install mega.nz"
wget https://mega.nz/linux/MEGAsync/xUbuntu_$(lsb_release -rs)/amd64/megasync-xUbuntu_$(lsb_release -rs)_amd64.deb -O megasync.deb
wget https://mega.nz/linux/MEGAsync/xUbuntu_$(lsb_release -rs)/amd64/dolphin-megasync-xUbuntu_$(lsb_release -rs)_amd64.deb -O dolphin-megasync.deb
sudo dpkg -i megasync.deb
sudo dpkg -i dolphin-megasync.deb
sudo apt-get install -f -y

echo "install anydesk"
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
sudo sh -c "echo 'deb http://deb.anydesk.com/ all main' > /etc/apt/sources.list.d/anydesk-stable.list"
sudo apt update
sudo apt install anydesk -y

echo "install teamviewer"
sudo sh -c "echo 'deb http://linux.teamviewer.com/deb stable main' >> /etc/apt/sources.list.d/teamviewer.list"
wget -q https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install teamviewer -y 

echo "install sublime-text"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo sh -c "echo 'deb https://download.sublimetext.com/ apt/stable/' >> /etc/apt/sources.list.d/sublime-text.list"
sudo apt-get update
sudo apt-get install sublime-text -y

echo "install vscode"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code


echo "install kodi"
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:team-xbmc/ppa
sudo apt-get update
sudo apt-get install kodi -y

echo "install others"
sudo apt install -y wine64 traceroute mc htop iftop iotop remmina remmina-plugin-rdp gnome-boxes timeshift 
