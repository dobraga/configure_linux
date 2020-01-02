cd /home/$USER/Downloads

#Adicionar PPA do chorme
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

#Atualiza o repositorio e instala pacotes
sudo apt update 
sudo snap install onlyoffice-desktopeditors docker code
sudo apt install gnome-tweak-tool google-chrome-stable git build-essential r-base r-dev chrome-gnome-shell -y

#Instalando pacotes R
sudo R --no-save -e "install.packages(c('tidyverse','tinytex', 'markdown'));tinytex::install_tinytex()"

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

# Tema slim
#https://www.gnome-look.org/p/1099856/
#https://github.com/EliverLara/Ant-Dracula

cd /usr/share/themes/
git clone https://github.com/EliverLara/Ant-Dracula.git

gsettings set org.gnome.desktop.interface gtk-theme "Ant-Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Ant-Dracula"

sudo apt dist-upgrade
sudo apt autoremove
