#!/bin/bash
 
# Find all dot files, delete them and restore the backup, if it exists
for file in $(find . -maxdepth 1 -name ".*" -type f -printf "%f\n" ); do
	[ -h ~/$file ] && rm -f ~/$file
	[ -e ~/${file}.bck ] && mv -f ~/$file{.bck,};
done

# For all folders in .config, back them up if they exist and create a symlink to the new folder
for folder in $(ls .config/ ); do
	[ -d ~/.config/$folder ] && rm -rdf ~/.config/$folder;
	[ -d ~/.config/${folder}.bck  ] && mv -f ~/.config/$folder{.bck,};
done

rm -frd ~/.tmux

echo "Uninstalled"
