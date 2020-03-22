anaconda="Anaconda3-2019.10-Linux-x86_64.sh"
wget "https://repo.anaconda.com/archive/"$anaconda
chmod +777 $anaconda
sh ./$anaconda -b
rm $anaconda

sudo chown $USER:$USER /etc/profile
echo "export PATH=$PATH:~/anaconda3/bin" >> /etc/profile

conda install -c conda-forge numpy pandas scikit-learn jupyterlab -y

sudo snap install onlyoffice-desktopeditors docker spotify
sudo snap install slack --classic
sudo snap install code --classic

#Adicionar PPA do chorme
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'

#Atualiza o repositorio e instala pacotes
sudo apt update 
sudo apt install gnome-tweak-tool google-chrome-stable git build-essential chrome-gnome-shell r-base libxml2-dev libcurl4-openssl-dev libssl-dev -y

R -e 'install.packages(c("tidyverse", "data.table", "dtplyr"))'

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

sudo apt dist-upgrade -y
sudo apt autoremove -y

# Dash to Panel, Caffeine, Soft brightness

# https://www.gnome-look.org/p/1099856/
