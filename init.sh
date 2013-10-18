#! /bin/bash

mkdir -pv ${HOME}/.vim/
mkdir -pv ${HOME}/.vim/colors/
mkdir -pv ${HOME}/.vnc/

ln -sv ${HOME}/.dotfiles/.tmux.conf ${HOME}/.tmux.conf
ln -sv ${HOME}/.dotfiles/.vimrc ${HOME}/.vimrc
ln -sv ${HOME}/.dotfiles/.vim/colors/ ${HOME}/.vim/colors
ln -sv ${HOME}/.dotfiles/.vnc/xstartup ${HOME}/.vnc/xstartup
