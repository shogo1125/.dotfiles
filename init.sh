#! /bin/bash
###############################
# init.sh (written by kazami)
# last update: 2014/12/24
###############################

set -e

die(){
  echo "$@" 1>&2
  echo "abort." 1>&2
  exit 1
}

# check if ${HOME} directory exists or not.
[ "${HOME}" = "" -o ! -d "${HOME}" ] && die "home directory not found: ${HOME}"

# get dotfiles path
cd "$(dirname "$0")"
DOTFILES_ROOT=$(pwd)

# check platform
PLATFORM=$(uname -s)

# create symbolic link
create_symlink(){
  local src=$1 dst=$2
  local overwrite= backup= skip=
  local action=

  #check if src file exist
  if [ ! -e "${src}" ]; then
    die "no such file or directory: ${src}"
  fi

  # check if dest file/dir/symlink exist
  if [ -f "${dst}" -o -d "${dst}" -o -L "${dst}" ]; then
    if [ "${overwrite_all}" == "false" ] && [ "${backup_all}" == "false" ] && [ "${skip_all}" == "false" ]; then

      # skip create link if already linked src to dst
      local currentSrc="$(readlink ${dst})"
      if [ "${currentSrc}" == "${src}" ]; then
        skip=true;

      else
        echo "Already exists: ${dst} ($(basename "${src}")), what do you want to do?"
        echo "[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read  action

        case "${action}" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi
    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "${overwrite}" == "true" ]; then
      rm -rf "${dst}"
      echo "removed ${dst}"
    fi

    if [ "${backup}" == "true" ]; then
      mv "${dst}" "${dst}.backup"
      echo "moved ${dst} to ${dst}.backup"
    fi

    if [ "${skip}" == "true" ]; then
      echo "skipped ${src}"
    fi
  fi

  if [ "${skip}" != "true" ]; then
    ln -s "$1" "$2"
    echo "linked $1 to $2"
  fi

}

main(){
  local overwrite_all=false backup_all=false skip_all=false

  #make directories
  mkdir -pv ${HOME}/.vim/
  mkdir -pv ${HOME}/.vim/bundle/
  mkdir -pv ${HOME}/.vnc/
  mkdir -pv ${HOME}/.tmux-powerline/

  create_symlink ${DOTFILES_ROOT}/tmux.conf ${HOME}/.tmux.conf
  create_symlink ${DOTFILES_ROOT}/gitconfig ${HOME}/.gitconfig
  create_symlink ${DOTFILES_ROOT}/vimrc ${HOME}/.vimrc
  create_symlink ${DOTFILES_ROOT}/vim/colors ${HOME}/.vim/colors
  create_symlink ${DOTFILES_ROOT}/vim/ftdetect ${HOME}/.vim/ftdetect
  create_symlink ${DOTFILES_ROOT}/vim/syntax ${HOME}/.vim/syntax
  create_symlink ${DOTFILES_ROOT}/vnc/xstartup ${HOME}/.vnc/xstartup
  create_symlink ${DOTFILES_ROOT}/tmux-powerlinerc ${HOME}/.tmux-powerlinerc
  create_symlink ${DOTFILES_ROOT}/tmux-powerlinetheme.sh ${HOME}/.tmux-powerlinetheme.sh

  # clone git repositories
  if [ -f ${HOME}/.tmux-powerline/powerline.sh ]; then
    echo "tmux-powerline exists."
  else
    git clone git://github.com/erikw/tmux-powerline ${HOME}/.tmux-powerline
  fi

  if [ -d ${HOME}/.vim/bundle/neobundle.vim/ ]; then
    echo "neobundle exists."
  else
    git clone git://github.com/Shougo/neobundle.vim ${HOME}/.vim/bundle/neobundle.vim
  fi

}

main

echo ''
echo 'Finished.'
