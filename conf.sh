# Configura ZSH
sudo chsh -s $(which zsh)


# Configura git
git config --global user.email "douglasmartinsbraga@gmail.com"
git config --global user.name "Douglas Braga"


# Copia configuração do ZSH
cp .zshrc ~


#Instalando pacotes R
sudo R --no-save -e "install.packages(c('tidyverse','tinytex'));tinytex::install_tinytex()"


# Configura cedilha
# https://www.danielkossmann.com/ajeitando-cedilha-errado-ubuntu-linux/
sudo su -c "echo '
GTK_IM_MODULE=cedilla
QT_IM_MODULE=cedilla' >> /etc/environment"


# Configura Fn Key
# https://askubuntu.com/questions/449001/how-do-i-activate-function-keys-without-pressing-the-fn-button-in-the-mac-keyboa
# https://superuser.com/questions/79822/how-to-swap-the-fn-use-of-function-keys-on-an-apple-keyboard-in-linux
echo "[Unit]
    Description=fnmode
[Service]
    Type=oneshot
    ExecStart=/bin/sh -c 'echo 2 > /sys/module/hid_apple/parameters/fnmode'
    RemainAfterExit=yes
[Install]
    WantedBy=multi-user.target"  | sudo tee -a /etc/systemd/system/fnmode.service

systemctl daemon-reload
systemctl start fnmode
systemctl enable fnmode


# Adiciona Anaconda, Julia e snap ao path
echo "export PATH=$PATH:~/anaconda3/bin:~/julia-1.5.0/bin:/snap/bin" >> ~/.zshrc
export PATH=$PATH:~/anaconda3/bin:~/julia-1.5.0/bin:/snap/bin

conda init zsh
conda config --set changeps1 False
conda install -c conda-forge jupyter_contrib_nbextensions -q -y && jupyter contrib nbextension install --user

julia -e 'using Pkg; Pkg.add(["IJulia", "DataFrames"])'


# Adiciona Pacotes ao ZSH
mkdir -p $ZSH/themes
mkdir -p $ZSH/plugins

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/themes/spaceship-prompt" --depth=1
ln -s "$ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme" 

git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH/plugins/zsh-autosuggestions"


# Instala pacotes snap
sudo snap install spotify onlyoffice-desktopeditors
sudo snap install code --classic
sudo snap install slack --classic


# Docker sem sudo
sudo usermod -aG docker ${USER}
su - ${USER}

# Configura GNOME
# https://askubuntu.com/questions/26056/where-are-gnome-keyboard-shortcuts-stored
# dconf dump '/' > custom-dconf.dconf
dconf load '/' < custom-dconf.dconf


# Instala pacotes do anaconda
conda install -c conda-forge numpy pandas scikit-learn notebook -y


# # Temas
# mkdir -p ~/.themes/   
# git clone https://github.com/EliverLara/Ant-Dracula --branch slim  ~/.themes/Ant-Dracula/
# git clone https://github.com/archbyte/Adwaita-Slim --branch dark ~/.themes/Adwaita-Slim-Dark/gtk-3.0/

sudo apt dist-upgrade -y
sudo apt autoremove -y

# User Themes, Caffeine, Soft brightness, WindowOverlay Icons, Material Shell, Dash to Panel, Sound Input & Output Device Chooser
