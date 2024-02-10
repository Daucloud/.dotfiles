#!/usr/bin/bash

files=(${$(ls -1a | grep -E "^\..+$" | grep -Ev "^\.\.$|^\.git$")})
for file in "${files[@]}"; do
	ln -s $(pwd)/$file ~/$file
done 
