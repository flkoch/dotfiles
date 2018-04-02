#!/bin/bash

rm ~/.bashrc
rm ~/.bash_aliases

ln -s dotfiles/.bashrc ~/
ln -s dotfiles/.bash_aliases ~/
