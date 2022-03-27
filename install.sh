sudo add-apt-repository universe -y

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


# Adiciona repository do terminator, node e yarn
sudo add-apt-repository ppa:gnome-terminator
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -


# Atualiza repositórios e instala pacotes
sudo apt update 
sudo apt install \
    google-chrome-stable git docker-ce zsh libcurl4-openssl-dev \
    locales-all cargo ripgrep fzf nodejs terminator yarn code \
    docker-ce docker-ce-cli gnome-tweaks dconf-editor -y

# Instala libs em rust
cargo install bat exa ytop

# Instala docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.3.4/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Remove libre office
sudo apt-get remove --purge libreoffice*

# Atualiza
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y

# Instala pyenv, poetry, starship e ohmyzsh
sh -c "$(curl -fsSL https://pyenv.run)"
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
