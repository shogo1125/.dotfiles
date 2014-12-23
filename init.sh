#! /bin/bash

print_help()
{
    echo "なし : うわがきしない"
    echo "-f   : ぜんぶうわがき"
    echo "-h : ヘルプ"
    exit 0
}

init()
{
    mkdir -pv ${HOME}/.vnc/
    mkdir -pv ${HOME}/.fonts/
    mkdir -pv ${HOME}/.tmux-powerline/
    mkdir -pv ${HOME}/.powerline-fonts/

    ln -sv ${HOME}/.dotfiles/tmux.conf ${HOME}/.tmux.conf
    ln -sv ${HOME}/.dotfiles/gitconfig ${HOME}/.gitconfig
    ln -sv ${HOME}/.dotfiles/vimrc ${HOME}/.vimrc
    ln -sv ${HOME}/.dotfiles/vim ${HOME}/.vim
    ln -sv ${HOME}/.dotfiles/vnc/xstartup ${HOME}/.vnc/xstartup
    ln -sv ${HOME}/.dotfiles/tmux-powerlinerc ${HOME}/.tmux-powerlinerc
    ln -sv ${HOME}/.dotfiles/tmux-powerlinetheme.sh ${HOME}/.tmux-powerlinetheme.sh

    git clone git://github.com/erikw/tmux-powerline ${HOME}/.tmux-powerline
    git clone https://github.com/Lokaltog/powerline-fonts ${HOME}/.powerline-fonts

    cp ${HOME}/.powerline-fonts/UbuntuMono/*.ttf ${HOME}/.fonts/
}

force_init()
{
    rm -rf ${HOME}/.vim
    rm -rf ${HOME}/.vnc
    rm -rf ${HOME}/.fonts/
    rm -rf ${HOME}/.tmux-powerline
    rm -rf ${HOME}/.powerline-fonts/
    
    mkdir -pv ${HOME}/.vnc/
    mkdir -pv ${HOME}/.fonts/
    mkdir -pv ${HOME}/.tmux-powerline/
    mkdir -pv ${HOME}/.powerline-fonts/

    ln -svnf ${HOME}/.dotfiles/tmux.conf ${HOME}/.tmux.conf
    ln -svnf ${HOME}/.dotfiles/gitconfig ${HOME}/.gitconfig
    ln -svnf ${HOME}/.dotfiles/vimrc ${HOME}/.vimrc
    ln -svnf ${HOME}/.dotfiles/vim ${HOME}/.vim
    ln -svnf ${HOME}/.dotfiles/vnc/xstartup ${HOME}/.vnc/xstartup
    ln -svnf ${HOME}/.dotfiles/tmux-powerlinerc ${HOME}/.tmux-powerlinerc
    ln -svnf ${HOME}/.dotfiles/tmux-powerlinetheme.sh ${HOME}/.tmux-powerlinetheme.sh

    git clone git://github.com/erikw/tmux-powerline ${HOME}/.tmux-powerline
    git clone https://github.com/Lokaltog/powerline-fonts ${HOME}/.powerline-fonts

    cp ${HOME}/.powerline-fonts/UbuntuMono/*.ttf ${HOME}/.fonts/
}

if [ $# -lt 1 ]; then
    init
fi

case $1 in
  "-f" )
    force_init;;
  "-h" )
    print_help;;
esac
