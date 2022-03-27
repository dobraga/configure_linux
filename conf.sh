# Configura cedilha
# https://www.danielkossmann.com/ajeitando-cedilha-errado-ubuntu-linux/
sudo su -c "echo '
GTK_IM_MODULE=cedilla
QT_IM_MODULE=cedilla' >> /etc/environment"

# Docker sem sudo
sudo usermod -aG docker ${USER}
su - ${USER}

# Configura dotfiles
git clone https://github.com/dobraga/dotfiles.git ~/dotfiles

rm -f ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

rm -f ~/.gitconfig
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

rm -rf ~/.config/terminator
mkdir ~/.config/terminator
ln -s ~/dotfiles/config.terminator ~/.config/terminator/config

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Configura GNOME
# https://askubuntu.com/questions/26056/where-are-gnome-keyboard-shortcuts-stored
# dconf dump '/' > ~/dotfiles/custom-dconf.toml
dconf load '/' < ~/dotfiles/custom-dconf.toml

# Configura ZSH
sudo chsh -s $(which zsh)
