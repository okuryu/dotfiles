#!/bin/bash

LOCAL_DIR=`pwd`
VIM=.vim
VIMRC=.vimrc
ZSHRC=.zshrc
LOCAL_VIM=$LOCAL_DIR/$VIM
LOCAL_VIMRC=$LOCAL_DIR/$VIMRC
LOCAL_ZSHRC=$LOCAL_DIR/$ZSHRC
HOME_VIM=$HOME/$VIM
HOME_VIMRC=$HOME/$VIMRC
HOME_ZSHRC=$HOME/$ZSHRC
VIM_BUNDLE=$HOME_VIM/bundle
VIM_AUTOLOAD=$HOME_VIM/autoload

function setup_vim() {
  mkdir -p $HOME_VIM
  cd $HOME_VIM
  git init
  mkdir $VIM_BUNDLE $VIM_AUTOLOAD
  git submodule add git://github.com/tpope/vim-pathogen.git $VIM_BUNDLE/vim-pathogen
  git submodule add git://github.com/altercation/vim-colors-solarized.git $VIM_BUNDLE/vim-colors-solarized
  git submodule add git://github.com/Shougo/neocomplcache.git $VIM_BUNDLE/neocomplcache
  ln -s $HOME_VIM/bundle/vim-pathogen/autoload/pathogen.vim $VIM_AUTOLOAD
  return 0
}

function setup_vimrc() {
  cp $LOCAL_VIMRC $HOME_VIMRC
  return 0
}

function setup_zshrc() {
  cp $LOCAL_ZSHRC $HOME_ZSHRC
  return 0
}

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
  echo NOTICE: $HOME_VIM is already exist.
else
  setup_vim
fi

if [ -f $HOME_VIMRC ]
then
  echo NOTICE: $HOME_VIMRC is already exist.
else
  setup_vimrc
fi

if [ -f $HOME_ZSHRC ]
then
  echo NOTICE: $HOME_ZSHRC is already exist.
else
  setup_zshrc
fi

