#!/bin/bash

if [ -f $HOME/.vimrc ]; then
	mv -i $HOME/.vimrc $HOME/.vimrc.bak
fi
if [ ! -d $HOME/.vim ]; then
    mkdir $HOME/.vim
fi
ln -si `pwd`/dotvim/colors $HOME/.vim/colors

if [ -f $HOME/.bashrc ]; then
	mv -i $HOME/.bashrc $HOME/.bashrc.bak
fi
ln -si `pwd`/bashrc $HOME/.bashrc
