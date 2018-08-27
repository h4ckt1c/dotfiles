#!/bin/bash

if [ -f $HOME/.vimrc ]; then
	mv -i $HOME/.vimrc $HOME/.vimrc.bak
fi
if [ ! -d $HOME/.vim ]; then
    mkdir $HOME/.vim
fi
if [ ! -d $HOME/.vim/undo ]; then
    mkdir $HOME/.vim/undo
fi
if [ -d $HOME/.vim/colors ]; then
    mv -i $HOME/.vim/colors $HOME/.vim/colors.bak
fi
if [ -d $HOME/.vim/bundle ]; then
    mv -i $HOME/.vim/bundle $HOME/.vim/colors.bak
fi
if [ -d $HOME/.vim/autoload ]; then
    mv -i $HOME/.vim/autoload $HOME/.vim/colors.bak
fi
ln -si `pwd`/dotvim/colors $HOME/.vim/colors
ln -si `pwd`/vimrc $HOME/.vimrc
ln -si `pwd`/dotvim/bundle $HOME/.vim/bundle
ln -si `pwd`/dotvim/autoload $HOME/.vim/autoload

if [ -f $HOME/.bashrc ]; then
	mv -i $HOME/.bashrc $HOME/.bashrc.bak
fi
ln -si `pwd`/bashrc $HOME/.bashrc
