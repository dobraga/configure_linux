cd /tmp/

# Instala fontes
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts
fc-cache -fv

# Instala temas
mkdir -p ~/.themes/
git clone https://github.com/dracula/gtk.git ~/.themes/dracula/
git clone https://github.com/EliverLara/Ant-Dracula --branch slim  ~/.themes/Ant-Dracula/
git clone https://github.com/archbyte/Adwaita-Slim --branch dark ~/.themes/Adwaita-Slim-Dark/gtk-3.0/

# Instala icones
mkdir -p ~/.icons/
git clone https://github.com/vinceliuice/Tela-icon-theme
./Tela-icon-theme/install.sh

# Extensões utilizadas
# Dash to Dock, User Themes, Caffeine, Soft brightness, WindowOverlay Icons, Dynamic Panel Transparency, Freon, Pixel Saver, Hide Top Bar, ShellTile, Unite
