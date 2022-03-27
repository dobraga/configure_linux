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

rm -f ~/.config/lvim/config.lua
ln -s ~/dotfiles/config.lua ~/.config/lvim/config.lua

rm -rf ~/.config/terminator
mkdir ~/.config/terminator
ln -s ~/dotfiles/config.terminator ~/.config/terminator/config

rm -rf ~/.config/lvim/lsp-settings
mkdir ~/.config/lvim/lsp-settings

# Configura GNOME
# https://askubuntu.com/questions/26056/where-are-gnome-keyboard-shortcuts-stored
# dconf dump '/' > ~/dotfiles/custom-dconf.toml
dconf load '/' < ~/dotfiles/custom-dconf.toml


# Configura ZSH
sudo chsh -s $(which zsh)
