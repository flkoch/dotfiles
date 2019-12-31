#!/bin/bash
 
# Find all dot files, delete them and restore the backup, if it exists
for file in $(find . -maxdepth 1 -name ".*" -type f -printf "%f\n" ); do
	if [ -h ~/$file ]; then
		rm -f ~/$file
	fi
	if [ -e ~/${file}.bck ]; then
		mv -f ~/$file{.bck,}
	fi
done

# For all folders in .config, back them up if they exist and create a symlink to the new folder
for folder in $(ls .config/ ); do
	if [ -d ~/.config/$folder ]; then
		rm -rdf ~/.config/$folder
	fi
	if [ -d ~/.config/${folder}.bck  ]; then
		mv -f ~/.config/$folder{.bck,}
	fi
done

rm -rd ~/.tmux

echo "Uninstalled"
