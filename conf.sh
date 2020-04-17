#anaconda="Anaconda3-2019.10-Linux-x86_64.sh"
#wget "https://repo.anaconda.com/archive/"$anaconda
#chmod +777 $anaconda
#sh ./$anaconda -b
#rm $anaconda

#echo "export PATH=$PATH:~/anaconda3/bin" >> ~/.bashrc

#conda install -c conda-forge numpy pandas scikit-learn jupyterlab -y

sudo snap install docker spotify
sudo snap install slack --classic
sudo snap install code --classic

#Adicionar PPA do chorme
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

#Adicionar repositorio do r
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'

#Atualiza o repositorio e instala pacotes
sudo apt update 
sudo apt install google-chrome-stable git build-essential r-base libxml2-dev libcurl4-openssl-dev libssl-dev -y

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

echo $XDG_CURRENT_DESKTOP
if [ "$XDG_CURRENT_DESKTOP" == "KDE" ]; then
    sudo apt install kio-gdrive korganizer kdepim -y
else
    sudo apt install gnome-tweak-tool chrome-gnome-shell -y
    mkdir -p ~/.themes
    cd ~/.themes
    git clone https://github.com/EliverLara/Ant-Dracula
fi

sudo apt dist-upgrade -y
sudo apt autoremove -y

# User Themes, Dash to Panel, Caffeine, Soft brightness

