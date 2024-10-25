#!/usr/bin/bash

files=(
	'.bashrc'
	'.zshrc'
	'.vimrc'
	'.tmux.conf'
      )

for file in "${files[@]}"; do
	if [ -e "$HOME/$file" ]; then
		echo "$file exists. Do you want to remove it and create a new $file?(y/n)"
		flag=false
		while true; do
			read choice
		case $choice in 
		y) 
		rm "$HOME/$file" 
		break
		;;
		n) 
		flag=true
		break
		;;
		*)
		echo "Please enter y or n."
		esac
		done
	if $flag; then
		continue	
	fi
	ln -s $(pwd)/$file $HOME/$file
	fi
	echo "Created symbolic link $file at $HOME"
done 
