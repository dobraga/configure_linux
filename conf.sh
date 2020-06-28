anaconda="Anaconda3-2020.02-Linux-x86_64.sh"
wget -c "https://repo.anaconda.com/archive/"$anaconda

chmod +777 $anaconda
chmod +777 install.sh

sh ./$anaconda -b
rm $anaconda


if grep -R "Fedora" /etc/os-release
then
    sudo yum install fedora-workstation-repositories -y
    sudo yum config-manager --set-enabled google-chrome
    sudo yum install google-chrome-stable git R snapd gnome-tweak-tool chrome-gnome-shell libxml2-devel openssl-devel libcurl-devel zsh -y
else
    #Adicionar PPA do chorme
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

    #Adicionar repositorio do r
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
    sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
    
    #Docker
    sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    
    #Atualiza repositórios e instala pacotes
    sudo apt update 
    apt-cache policy docker-ce
    sudo apt install google-chrome-stable git snapd docker-ce zsh -y
    
    echo $XDG_CURRENT_DESKTOP
    if [ "$XDG_CURRENT_DESKTOP" == "KDE" ]; then
        sudo apt install kio-gdrive korganizer kdepim -y
    else
        sudo apt install gnome-tweak-tool chrome-gnome-shell -y
        gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
    fi
fi

#Configura git
git config --global user.email "douglasmartinsbraga@gmail.com"
git config --global user.name "Douglas Braga"

#Configura snap, anaconda, zsh
sudo ln -s /var/lib/snapd/snap /snap
echo "export PATH=$PATH:~/anaconda3/bin:/snap/bin" >> ~/.bashrc
echo "export PATH=$PATH:~/anaconda3/bin:/snap/bin" >> ~/.zshrc

echo '
# PROMPT
SPACESHIP_PROMPT_SYMBOL=">"
SPACESHIP_PROMPT_ADD_NEWLINE=false

# CONDA
SPACESHIP_CONDA_SYMBOL="🐍 "
' >> ~/.zshrc

sudo chsh -s $(which zsh)
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
#Set ZSH_THEME="spaceship" in your .zshrc and add zsh-autosuggestions in plugins.

conda init zsh


#Instala pacotes snap
sudo snap install spotify onlyoffice-desktopeditors
sudo snap install code --classic
sudo snap install slack --classic

#Docker sem sudo
sudo usermod -aG docker ${USER}
su - ${USER}

#Instala pacotes do anaconda
conda install -c conda-forge numpy pandas scikit-learn jupyterlab -y

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

reboot

# User Themes, Dash to Panel, Caffeine, Soft brightness, Sound Input & Output Device Chooser, WindowOverlay Icons 
