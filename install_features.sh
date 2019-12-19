cd /home/$USER/Downloads

#Adicionar PPA do chorme
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

#Adicionar PPA do deepin
sudo add-apt-repository ppa:noobslab/deepin-sc

#Atualiza o repositorio e instala pacotes
sudo apt update 
sudo snap install onlyoffice-desktopeditors docker code
sudo apt install gnome-tweak-tool nemo deepin-terminal google-chrome-stable git build-essential r-base r-dev chrome-gnome-shell -y

#Instalando pacotes R
sudo R --no-save -e "install.packages(c('tidyverse','tinytex', 'markdown'));tinytex::install_tinytex()"

#Utilizar o nemo
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true
gsettings set org.cinnamon.desktop.default-applications.terminal exec deepin-terminal

#utilizar docker sem sudo
sudo snap connect docker:home

sudo groupadd docker
sudo usermod -aG docker $USER

sudo systemctl enable docker
sudo systemctl restart docker.service
sudo snap disable docker
sudo snap enable docker

#dash to panel
#unity

sudo apt dist-upgrade
sudo apt autoremove
