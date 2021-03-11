sudo add-apt-repository universe -y

# Repositorio do R
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu groovy-cran40/'

# Instala JuliaLang
wget -c  "https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.0-linux-x86_64.tar.gz" -P /tmp/
tar -xf /tmp/julia-1.5.0-linux-x86_64.tar.gz -C ~/

# Adicionar PPA do chorme
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Adicionar repositorio do Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# Adiciona repositório do vscode
echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" | sudo \
   tee /etc/apt/sources.list.d/vs-code.list
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

# Atualiza repositórios e instala pacotes
sudo apt update 
sudo apt install flatpak python3-pip google-chrome-stable git docker-ce zsh fonts-firacode libcurl4-openssl-dev r-base code -y
pip3 install --user poetry
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Instala pacotes snap/flatpak
flatpak install flathub com.slack.Slack com.spotify.Client -y
# sudo snap install spotify onlyoffice-desktopeditors
# sudo snap install code --classic
# sudo snap install slack --classic

# Instala docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Remove libre office
sudo apt-get remove --purge libreoffice*

# Instala ohmyzsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
