#!/bin/bash

LOCAL_DIR=`pwd`
DOT_FILES="
.bash_profile
.gitconfig
.tmux.conf
.vimrc
.zshrc
"
VIM=.vim
ZSH=.zsh
LOCAL_VIM=${LOCAL_DIR}/${VIM}
HOME_VIM=$HOME/${VIM}
HOME_ZSH=$HOME/${ZSH}
VIM_BUNDLE=${HOME_VIM}/bundle
VIM_AUTOLOAD=${HOME_VIM}/autoload
ZSH_COMPLETION=${HOME_ZSH}/functions/Completion

setup_dot_files () {
  for DOT_FILE in ${DOT_FILES}
  do
    cp ${LOCAL_DIR}/${DOT_FILE} $HOME/${DOT_FILE}
  done
}

main () {
  if [ ! -x `which git` ]
  then
    echo ERROR: git is not exist.
    exit 1
  fi
  if [ ! -x `which zsh` ]
  then
    echo ERROR: zsh is not exist.
    exit 1
  fi
  if [ -d ${HOME_VIM} ]
  then
    rm -rf ${HOME_VIM}
  fi
  setup_vim
  if [ -d ${HOME_ZSH} ]
  then
    rm -rf ${HOME_ZSH}
  fi
  setup_zsh
  setup_dot_files
}

setup_vim () {
  mkdir -p ${HOME_VIM}
  cd ${HOME_VIM}
  git init
  mkdir ${VIM_BUNDLE} ${VIM_AUTOLOAD}
  git submodule add git://github.com/tpope/vim-pathogen.git ${VIM_BUNDLE}/vim-pathogen
  git submodule add git://github.com/altercation/vim-colors-solarized.git ${VIM_BUNDLE}/vim-colors-solarized
  git submodule add git://github.com/Shougo/neocomplcache.git ${VIM_BUNDLE}/neocomplcache
  git submodule add git://github.com/vim-scripts/sudo.vim.git ${VIM_BUNDLE}/sudo
  git submodule add git://github.com/tpope/vim-markdown.git ${VIM_BUNDLE}/vim-markdown
  git submodule add git://github.com/mattn/webapi-vim.git ${VIM_BUNDLE}/webapi-vim
  git submodule add git://github.com/mattn/gist-vim.git ${VIM_BUNDLE}/gist-vim
  ln -s ${HOME_VIM}/bundle/vim-pathogen/autoload/pathogen.vim ${VIM_AUTOLOAD}
}

setup_zsh () {
  mkdir -p ${ZSH_COMPLETION}
  cd ${ZSH_COMPLETION}
  curl -k -O https://raw.github.com/knu/zsh-git-escape-magic/master/git-escape-magic
}

main
