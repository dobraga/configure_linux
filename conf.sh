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
# https://blogdobillgates.wordpress.com/2014/08/12/problema-com-c-no-linux-ubuntu-saindo-c/


# Adiciona Anaconda, Julia e snap ao path
echo "export PATH=$PATH:~/anaconda3/bin:~/julia-1.5.0/bin:/snap/bin" >> ~/.zshrc
export PATH=$PATH:~/anaconda3/bin:~/julia-1.5.0/bin:/snap/bin

conda init zsh
conda config --set changeps1 False
conda install -c conda-forge jupyter_contrib_nbextensions -q -y && jupyter contrib nbextension install --user

julia -e 'using Pkg; Pkg.add(["IJulia", "DataFrames"])'

# Adiciona Pacotes ao ZSH
mkdir -p $ZSH_CUSTOM/themes
mkdir -p $ZSH_CUSTOM/plugins

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 


# Instala pacotes snap
sudo snap install spotify onlyoffice-desktopeditors
sudo snap install code --classic
sudo snap install slack --classic


# Docker sem sudo
sudo usermod -aG docker ${USER}
su - ${USER}

# Configura GNOME
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.desktop.wm.keybindings close ['<Super>q']
gsettings set org.gnome.desktop.wm.keybindings minimize ['<Super>h']
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left ['<Super><Shift>a']
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right ['<Super><Shift>d']
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down ['<Shift><Super>s']
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up ['<Shift><Super>w']
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down ['<Super>s']
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up ['<Super>w']
gsettings set org.gnome.desktop.wm.keybindings switch-windows ['<Alt>Tab']
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward ['<Shift><Alt>Tab']
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized ['<Super>Up']


# Instala pacotes do anaconda
conda install -c conda-forge numpy pandas scikit-learn notebook -y


# Temas
mkdir -p ~/.themes
git clone https://github.com/EliverLara/Ant-Dracula --branch slim  ~/.themes/Ant-Dracula/
git clone https://github.com/archbyte/Adwaita-Slim --branch dark ~/.themes/Adwaita-Slim-Dark/gtk-3.0/

sudo apt dist-upgrade -y
sudo apt autoremove -y

# User Themes, Caffeine, Soft brightness, WindowOverlay Icons, Material Shell, Dash to Panel, Sound Input & Output Device Chooser
