#!/bin/bash

LOCAL_DIR=`pwd`
VIM=.vim
VIMRC=.vimrc
TMUXCONF=.tmux.conf
ZSH=.zsh
ZSHRC=.zshrc
BASH_PROFILE=.bash_profile
LOCAL_VIM=$LOCAL_DIR/$VIM
LOCAL_VIMRC=$LOCAL_DIR/$VIMRC
LOCAL_TMUXCONF=$LOCAL_DIR/$TMUXCONF
LOCAL_ZSHRC=$LOCAL_DIR/$ZSHRC
LOCAL_BASH_PROFILE=$LOCAL_DIR/$BASH_PROFILE
HOME_VIM=$HOME/$VIM
HOME_VIMRC=$HOME/$VIMRC
HOME_TMUXCONF=$HOME/$TMUXCONF
HOME_ZSH=$HOME/$ZSH
HOME_ZSHRC=$HOME/$ZSHRC
HOME_BASH_PROFILE=$HOME/$BASH_PROFILE
VIM_BUNDLE=$HOME_VIM/bundle
VIM_AUTOLOAD=$HOME_VIM/autoload
ZSH_COMPLETION=$HOME_ZSH/functions/Completion

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
  if [ -d $HOME_VIM ]
  then
    rm -rf $HOME_VIM
  fi
  setup_vim
  if [ -f $HOME_VIMRC ]
  then
    rm -rf $HOME_VIMRC
  fi
  setup_vimrc
  setup_tmuxconf
  if [ -d $HOME_ZSH ]
  then
    rm -rf $HOME_ZSH
  fi
  setup_zsh
  if [ -f $HOME_ZSHRC ]
  then
    rm -rf $HOME_ZSHRC
  fi
  setup_zshrc
  if [ -f $HOME_BASH_PROFILE ]
  then
    rm -rf $HOME_BASH_PROFILE
  fi
  setup_bash_profile
}

setup_vim () {
  mkdir -p $HOME_VIM
  cd $HOME_VIM
  git init
  mkdir $VIM_BUNDLE $VIM_AUTOLOAD
  git submodule add git://github.com/tpope/vim-pathogen.git $VIM_BUNDLE/vim-pathogen
  git submodule add git://github.com/altercation/vim-colors-solarized.git $VIM_BUNDLE/vim-colors-solarized
  git submodule add git://github.com/Shougo/neocomplcache.git $VIM_BUNDLE/neocomplcache
  git submodule add git://github.com/vim-scripts/sudo.vim.git $VIM_BUNDLE/sudo
  git submodule add git://github.com/tpope/vim-markdown.git $VIM_BUNDLE/vim-markdown
  ln -s $HOME_VIM/bundle/vim-pathogen/autoload/pathogen.vim $VIM_AUTOLOAD
}

setup_vimrc () {
  cp $LOCAL_VIMRC $HOME_VIMRC
}

setup_tmuxconf () {
  cp $LOCAL_TMUXCONF $HOME_TMUXCONF
}

setup_zsh () {
  mkdir -p $ZSH_COMPLETION
  cd $ZSH_COMPLETION
  curl -k -O https://raw.github.com/knu/zsh-git-escape-magic/master/git-escape-magic
}

setup_zshrc () {
  cp $LOCAL_ZSHRC $HOME_ZSHRC
}

setup_bash_profile () {
  cp $LOCAL_BASH_PROFILE $HOME_BASH_PROFILE
}

main

