# Configura ZSH
sudo chsh -s $(which zsh)


# Configura git
git config --global user.email "douglasmartinsbraga@gmail.com"
git config --global user.name "Douglas Braga"


# Copia configuração do ZSH
cp .zshrc ~


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


# Adiciona Julia e snap ao path
echo "export PATH=$PATH:~/julia-1.5.0/bin:/snap/bin" >> ~/.zshrc
export PATH=$PATH:~/julia-1.5.0/bin:/snap/bin


# Adiciona Pacotes ao ZSH
mkdir -p $ZSH/themes
mkdir -p $ZSH/plugins

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/themes/spaceship-prompt" --depth=1
ln -s "$ZSH/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/themes/spaceship.zsh-theme" 

git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH/plugins/zsh-autosuggestions"


# Docker sem sudo
sudo usermod -aG docker ${USER}
su - ${USER}

sudo apt dist-upgrade -y
sudo apt autoremove -y

