#!/bin/bash

main () {
  local C_GREEN="\033[0;32m"
  local C_NONE="\033[0;00m"
  if [ ! -x `which git` ]
  then
    echo ERROR: git is not exist.
    exit 1
  fi
  echo -e ${C_GREEN}removing ~/.tmux.conf${C_NONE}
  [ -f ~/.tmux.conf ] && rm -f ~/.tmux.conf
  echo -e ${C_GREEN}removing ~/.zsh${C_NONE}
  [ -d ~/.zsh ] && rm -rf ~/.zsh
  echo -e ${C_GREEN}removing ~/.zshrc${C_NONE}
  [ -f ~/.zshrc ] && rm -f ~/.zshrc
  echo -e ${C_GREEN}removing ~/.bash_profile${C_NONE}
  [ -f ~/.bash_profile ] && rm -f ~/.bash_profile
  echo -e ${C_GREEN}removing ~/.vim${C_NONE}
  [ -d ~/.vim ] && rm -rf ~/.vim
  echo -e ${C_GREEN}removing ~/.vimrc${C_NONE}
  [ -f ~/.vimrc ] && rm -f ~/.vimrc
  echo -e ${C_GREEN}removing ~/.config/fish/functions/gvm.fish${C_NONE}
  [ -f ~/.config/fish/functions/gvm.fish ] && rm -f ~/.config/fish/functions/gvm.fish
  echo -e ${C_GREEN}removing ~/.config/fish/functions/jdk.fish${C_NONE}
  [ -f ~/.config/fish/functions/jdk.fish ] && rm -f ~/.config/fish/functions/jdk.fish
  echo -e ${C_GREEN}configuring ~/.config/fish${C_NONE}
  [ ! -d ~/.config/fish ] && mkdir -p ~/.config/fish
  echo -e ${C_GREEN}configuring ~/.config/fish/config.fish${C_NONE}
  cp ./config.fish ~/.config/fish/config.fish
  echo -e ${C_GREEN}configuring ~/.config/fish/functions/jdk.fish${C_NONE}
  cp ./jdk.fish ~/.config/fish/functions/jdk.fish
  echo -e ${C_GREEN}configuring ~/.gitconfig${C_NONE}
  cp ./.gitconfig ~/.gitconfig
  echo -e ${C_GREEN}configuring ~/.gitignore_global${C_NONE}
  cp ./.gitignore_global ~/.gitignore_global
  echo -e ${C_GREEN}configuring ~/.nanorc${C_NONE}
  cp ./.nanorc ~/.nanorc
  echo -e ${C_GREEN}[OK]${C_NONE}
}

main
