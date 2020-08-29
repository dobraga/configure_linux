# Remve libre office
sudo apt-get remove --purge libreoffice*

# Copia configuração do ZSH
cp .zshrc ~

# Configura ZSH
sudo chsh -s $(which zsh)

# Configura Anaconda e Julia
echo "export PATH=$PATH:~/anaconda3/bin:~/julia-1.5.0/bin:/snap/bin" >> ~/.zshrc

export PATH=$PATH:~/anaconda3/bin:~/julia-1.5.0/bin
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
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Primary><Shift><Super>Down']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Primary><Shift><Super>Up']"

# Instala pacotes do anaconda
conda install -c conda-forge numpy pandas scikit-learn jupyterlab -y

# Instala extenções do visual studio e configura keys
code --install-extension eamodio.gitlens
code --install-extension ms-python.python
code --install-extension PKief.material-icon-theme
code --install-extension ms-azuretools.vscode-docker
code --install-extension christian-kohler.path-intellisense
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension Ikuyadeu.r
code --install-extension geddski.macros
code --install-extension yzhang.markdown-all-in-one
code --install-extension 2gua.rainbow-brackets

mkdir ~/.config/Code/User -p
cp ./keybindings.json ~/.config/Code/User
cp ./settings.json ~/.config/Code/User

# Temas
mkdir -p ~/.themes
git clone https://github.com/EliverLara/Ant-Dracula --branch slim  ~/.themes/Ant-Dracula/
git clone https://github.com/archbyte/Adwaita-Slim --branch dark ~/.themes/Adwaita-Slim-Dark/gtk-3.0/

sudo apt dist-upgrade -y
sudo apt autoremove -y

# User Themes, Caffeine, Soft brightness, WindowOverlay Icons, Material Shell, Dash to Panel, Sound Input & Output Device Chooser
