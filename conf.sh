cd /home/$USER/Downloads
anaconda = "Anaconda3-2019.10-Linux-x86_64.sh"
wget "https://repo.anaconda.com/archive/"+anaconda
chmod anaconda +777
sh anaconda -b
conda install numpy pandas scikit-learn jupyterlab r-essentials r-tidyverse rstudio -y


#Adicionar PPA do chorme
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

#Atualiza o repositorio e instala pacotes
sudo apt update 
sudo snap install onlyoffice-desktopeditors docker slack spotify
sudo snap install code --classic
sudo apt install gnome-tweak-tool google-chrome-stable git build-essential chrome-gnome-shell -y

git config --global user.email "douglasmartinsbraga@gmail.com"
git config --global user.name "Douglas Braga"

code --install-extension eamodio.gitlens
code --install-extension ms-python.python
code --install-extension PKief.material-icon-theme
code --install-extension ms-azuretools.vscode-docker
code --install-extension christian-kohler.path-intellisense
code --install-extension VisualStudioExptTeam.vscodeintellicode

#utilizar docker sem sudo
sudo snap connect docker:home
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker
sudo systemctl restart docker.service
sudo snap disable docker
sudo snap enable docker

sudo apt dist-upgrade
sudo apt autoremove

# Dash to Panel, Caffeine, Soft brightness
