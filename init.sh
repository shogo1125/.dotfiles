#! /bin/bash

print_help()
{
    echo "なし : うわがきしない"
    echo "-f   : ぜんぶうわがき"
    echo "help : ヘルプ"
    exit 0
}

init()
{
    mkdir -pv ${HOME}/.vim/
    mkdir -pv ${HOME}/.vnc/

    ln -sv ${HOME}/.dotfiles/.tmux.conf ${HOME}/.tmux.conf
    ln -sv ${HOME}/.dotfiles/.gitconfig ${HOME}/.gitconfig
    ln -sv ${HOME}/.dotfiles/.vimrc ${HOME}/.vimrc
    ln -sv ${HOME}/.dotfiles/.vim/colors ${HOME}/.vim/
    ln -sv ${HOME}/.dotfiles/.vnc/xstartup ${HOME}/.vnc/xstartup
}

force_init()
{
    mkdir -pv ${HOME}/.vim/
    mkdir -pv ${HOME}/.vnc/

    rm -rf ${HOME}/.vim/colors

    ln -svnf ${HOME}/.dotfiles/.tmux.conf ${HOME}/.tmux.conf
    ln -svnf ${HOME}/.dotfiles/.gitconfig ${HOME}/.gitconfig
    ln -svnf ${HOME}/.dotfiles/.vimrc ${HOME}/.vimrc
    ln -svnf ${HOME}/.dotfiles/.vim/colors ${HOME}/.vim/
    ln -svnf ${HOME}/.dotfiles/.vnc/xstartup ${HOME}/.vnc/xstartup
}

if [ $# -lt 1 ]; then
    init
fi

case $1 in
  "-f" )
    force_init;;
  "help" )
    print_help;;
esac
