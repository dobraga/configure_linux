cd /tmp

# Instala Anaconda
anaconda="Anaconda3-2020.02-Linux-x86_64.sh"
wget -c "https://repo.anaconda.com/archive/"$anaconda
chmod +777 $anaconda
sh ./$anaconda -b
rm $anaconda

# Instala JuliaLang
wget -c  "https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.0-linux-x86_64.tar.gz"
tar -xf julia-1.5.0-linux-x86_64.tar.gz -C ~/

# Adicionar PPA do chorme
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Adicionar repositorio do r
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'

# Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# Atualiza repositórios e instala pacotes
sudo apt update 
sudo apt install google-chrome-stable git snapd docker-ce zsh -y

# Configura git
git config --global user.email "douglasmartinsbraga@gmail.com"
git config --global user.name "Douglas Braga"

# Instala e configura ohmyzsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
cp .zshrc ~

# Configura ZSH
sudo chsh -s $(which zsh)

# Configura Anaconda e Julia
echo "export PATH=$PATH:~/anaconda3/bin:~/julia-1.5.0/bin" >> ~/.zshrc
export PATH=$PATH:~/anaconda3/bin
conda config --set changeps1 False

julia -e 'using Pkg; Pkg.add(["IJulia", "DataFrames"])'

# Adiciona Pacotes ao ZSH
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

# Instala pacotes snap
sudo snap install spotify onlyoffice-desktopeditors
sudo snap install code --classic
sudo snap install slack --classic

# Docker sem sudo
sudo usermod -aG docker ${USER}
su - ${USER}

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

# User Themes, Dash to Panel, Caffeine, Soft brightness, Sound Input & Output Device Chooser, WindowOverlay Icons 
