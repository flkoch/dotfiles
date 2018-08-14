#!/bin/bash

# remove previous files and folders
rm ~/.bashrc
rm ~/.bash_aliases
rm -rfd ~/.config/i3
rm -rfd ~/.config/i3status
rm -rfd ~/.config/nvim
# Create all required folders
mkdir -p ~/.config/i3
mkdir -p ~/.config/i3status
mkdir -p ~/.config/nvim
mkdir -p ~/.local/share/nvim/site/autoload

# Create links for all configurations files
ln -s ~/dotfiles/.bashrc ~/
ln -s ~/dotfiles/.bash_aliases ~/
ln -s ~/dotfiles/.config/i3/config ~/.config/i3/
ln -s ~/dotfiles/.config/i3status/config ~/.config/i3status/
ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/

# Install vim-plug plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
