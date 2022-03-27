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

# Instala cursor
https://dl1.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MTYyMjE5NDE5NywidSI6bnVsbCwibHQiOiJkb3dubG9hZCIsInMiOiJjNGRlOTI3OTAxZjY4OWYwOGI1NzdhNjc5NDQyMTRhZjc0MDJjYjI0NmJkMjY4MzM1OWFlNDJkZDkwOTc3N2Y4M2VkOGZjNWM5ZDJlZTYxNmFlMGYzZTFmNDE5ZmQ4Yzg3NDQzMThmYjc4ZDQ5ODRlNTdlOGVmY2RkMGNlYmYzOCIsInQiOjE2NDg0MTc4NDEsInN0ZnAiOiIzZTdjMjNkZGViOTUxOWMxMDBhMDllYTI4NzI3MTI0NyIsInN0aXAiOiIyODA0OjdmMTplNzgzOjQxMGI6MzM5ODo5MjU4OmFiYWM6ZDk1ZiJ9.rtRfNoOwbFKyUCCqhkQ-pksCyHGs8NR6hTN6MWpNbOU/oreo_black_cursors.tar.gz
tar -xvf  -C ~/.icons/

# Extensões utilizadas
# Dash to Dock, User Themes, Caffeine, Soft brightness, WindowOverlay Icons, Dynamic Panel Transparency, Freon, Pixel Saver, Hide Top Bar, ShellTile, Unite
