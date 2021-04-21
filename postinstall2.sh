#/bin/bash

# config repositories

#google chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

#anydesk
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
sudo sh -c "echo 'deb http://deb.anydesk.com/ all main' > /etc/apt/sources.list.d/anydesk-stable.list"

#teamviewer
sudo sh -c "echo 'deb http://linux.teamviewer.com/deb stable main' >> /etc/apt/sources.list.d/teamviewer.list"
wget -q https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc -O- | sudo apt-key add -

#sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo sh -c "echo 'deb https://download.sublimetext.com/ apt/stable/' >> /etc/apt/sources.list.d/sublime-text.list"

#vscode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

#kodi
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:team-xbmc/ppa

#download mega
wget https://mega.nz/linux/MEGAsync/xUbuntu_$(lsb_release -rs)/amd64/megasync-xUbuntu_$(lsb_release -rs)_amd64.deb -O megasync.deb
wget https://mega.nz/linux/MEGAsync/xUbuntu_$(lsb_release -rs)/amd64/dolphin-megasync-xUbuntu_$(lsb_release -rs)_amd64.deb -O dolphin-megasync.deb


#install packages
sudo apt update
sudo apt full-upgrade -y
sudo dpkg -i megasync.deb
sudo dpkg -i dolphin-megasync.deb
sudo apt install -f -y wine64 traceroute mc htop iftop iotop remmina remmina-plugin-rdp gnome-boxes timeshift kodi code sublime-text teamviewer anydesk google-chrome-stable

