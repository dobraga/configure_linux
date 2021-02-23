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

# Atualiza repositórios e instala pacotes
sudo apt update 
sudo apt install python3-pip snapd google-chrome-stable git docker-ce zsh fonts-firacode r-base libcurl4-openssl-dev -y
pip3 install --user poetry

# Instala pacotes snap
sudo snap install spotify onlyoffice-desktopeditors
sudo snap install code --classic
sudo snap install slack --classic

# Instala docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Remove libre office
sudo apt-get remove --purge libreoffice*

# Instala ohmyzsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
