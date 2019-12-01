#Baixar anaconda python
cd /home/$USER/Downloads

wget -c https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
chmod +777 Anaconda3-2019.10-Linux-x86_64.sh
./Anaconda3-2019.10-Linux-x86_64.sh -b

#Adicionar PPA do chorme
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

#Adicionar PPA do deepin
sudo add-apt-repository ppa:noobslab/deepin-sc

#Atualiza o repositorio e instala pacotes
sudo apt update 
sudo snap install onlyoffice-desktopeditors
sudo apt install flatpak gnome-tweak-tool nemo deepin-terminal google-chrome-stable git build-essential r-base chrome-gnome-shell -y

#Instalando pacotes R
sudo R --no-save -e "install.packages(c('tidyverse','tinytex'));tinytex::install_tinytex();install.packages('markdown')"

#Utilizar o nemo
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true
gsettings set org.cinnamon.desktop.default-applications.terminal exec deepin-terminal

#Adicionar o repositorio do flathub e instalar o visual studio
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.visualstudio.code -y


#unite
#dash-to-dock
#Dynamic Panel Transparency

sudo apt dist-upgrade
sudo apt autoremove


#sudo update-alternatives --config x-terminal-emulator
#/org/cinnamon/desktop/applications/terminal/exec
