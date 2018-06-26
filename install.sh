#!/bin/bash

rm ~/.bashrc
rm ~/.bash_aliases
rm -rd ~/.config/i3
rm -rd ~/.config/i3status
mkdir ~/.config/i3
mkdir ~/.config/i3status

ln -s dotfiles/.bashrc ~/
ln -s dotfiles/.bash_aliases ~/
ln -s dotfiles/.config/i3/config ~/.config/i3/
ln -s dotfiles/.config/i3status/config ~/.config/i3status/
