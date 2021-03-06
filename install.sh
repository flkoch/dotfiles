#!/bin/bash
 
# Find all dot files, back them up if they exist and create a symlink to the new dot file
for file in $(find . -maxdepth 1 -name ".*" -type f -printf "%f\n" ); do
	[ -e ~/$file ] &&	mv -f ~/$file{,.bck};
	ln -s $PWD/$file ~/$file
done

# For all folders in .config, back them up if they exist and create a symlink to the new folder
[ -d ~/.config ] || mkdir ~/.config;
for folder in $(ls .config/ ); do
	[ -d ~/.config/$folder ] && mv -f ~/.config/$folder{,.bck};
	mkdir ~/.config/$folder
	for file in $(ls .config/$folder ); do
		ln -s $PWD/.config/$folder/$file ~/.config/$folder/$file
	done
done

# Install vim-plug plugin manager
mkdir -p ~/.local/share/nvim/site/autoload
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installed"
