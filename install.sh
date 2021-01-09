sudo add-apt-repository universe -y

# Instala Anaconda
anaconda="Anaconda3-2020.11-Linux-x86_64.sh"
wget -c "https://repo.anaconda.com/archive/"$anaconda -P /tmp/
chmod +777 /tmp/$anaconda
sh /tmp/$anaconda -b

# Instala R
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/'

# Instala JuliaLang
wget -c  "https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.0-linux-x86_64.tar.gz" -P /tmp/
tar -xf /tmp/julia-1.5.0-linux-x86_64.tar.gz -C ~/

# Adicionar PPA do chorme
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Adicionar repositorio do r
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'

# Adicionar repositorio do Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# Atualiza repositórios e instala pacotes
sudo apt update 
sudo apt install google-chrome-stable git r-base docker-ce zsh libssl-dev libcurl4-openssl-dev fonts-firacode -y

# Remve libre office
sudo apt-get remove --purge libreoffice*

# Instala ohmyzsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
