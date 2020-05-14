anaconda="Anaconda3-2020.02-Linux-x86_64.sh"
wget -c "https://repo.anaconda.com/archive/"$anaconda
chmod +777 $anaconda
sh ./$anaconda -b
rm $anaconda

echo "export PATH=$PATH:~/anaconda3/bin" >> ~/.bashrc
conda install -c conda-forge numpy pandas scikit-learn jupyterlab -y

if grep -R "Fedora" /etc/os-release
then
    sudo yum install fedora-workstation-repositories -y
    sudo yum config-manager --set-enabled google-chrome
    sudo yum install google-chrome-stable git R flatpak snapd gnome-tweak-tool chrome-gnome-shell libxml2-devel openssl-devel libcurl-devel -y
else
    #Adicionar PPA do chorme
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

    #Adicionar repositorio do r
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
    sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'

    #Atualiza repositórios e instala pacotes
    sudo apt update 
    sudo apt install google-chrome-stable git build-essential r-base flatpak snapd libcurl4-openssl-dev libxml2-dev libssl-dev libcurl4-openssl-de -y #libxml2-dev libssl-dev
    
    echo $XDG_CURRENT_DESKTOP
    if [ "$XDG_CURRENT_DESKTOP" == "KDE" ]; then
        sudo apt install kio-gdrive korganizer kdepim -y
    else
        sudo apt install gnome-tweak-tool chrome-gnome-shell -y
    fi
fi

#Configura git
git config --global user.email "douglasmartinsbraga@gmail.com"
git config --global user.name "Douglas Braga"

#Configura flatpak e instala pacotes snap e flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.wps.Office -y
sudo service snapd start
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install spotify
sudo snap install code --classic
sudo snap install slack --classic

#Instala extenções do visual studio
code --install-extension eamodio.gitlens
code --install-extension ms-python.python
code --install-extension PKief.material-icon-theme
code --install-extension ms-azuretools.vscode-docker
code --install-extension christian-kohler.path-intellisense
code --install-extension VisualStudioExptTeam.vscodeintellicode

mkdir -p ~/.themes
git clone https://github.com/EliverLara/Ant-Dracula --branch slim  ~/.themes/Ant-Dracula/
git clone https://github.com/archbyte/Adwaita-Slim --branch dark ~/.themes/Adwaita-Slim-Dark/gtk-3.0/

if grep -R "Fedora" /etc/os-release
then
    sudo yum upgrade -y
    sudo yum autoremove -y
else
    sudo apt dist-upgrade -y
    sudo apt autoremove -y
fi

# User Themes, Dash to Panel, Caffeine, Soft brightness, Sound Input & Output Device Chooser, WindowOverlay Icons 
