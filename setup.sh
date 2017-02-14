#!/bin/sh

main () {
  local C_GREEN="\033[0;32m"
  local C_NONE="\033[0;00m"
  if [ ! -x `which git` ]
  then
    echo ERROR: git is not exist.
    exit 1
  fi
  echo ${C_GREEN}removing ~/.tmux.conf${C_NONE}
  [ -f ~/.tmux.conf ] && rm -f ~/.tmux.conf
  echo ${C_GREEN}removing ~/.zsh${C_NONE}
  [ -d ~/.zsh ] && rm -rf ~/.zsh
  echo ${C_GREEN}removing ~/.zshrc${C_NONE}
  [ -f ~/.zshrc ] && rm -f ~/.zshrc
  echo ${C_GREEN}removing ~/.bash_profile${C_NONE}
  [ -f ~/.bash_profile ] && rm -f ~/.bash_profile
  echo ${C_GREEN}configuring ~/.config/fish${C_NONE}
  [ ! -d ~/.config/fish ] && mkdir -p ~/.config/fish
  echo ${C_GREEN}configuring ~/.config/fish/config.fish${C_NONE}
  cp ./config.fish ~/.config/fish/config.fish
  echo ${C_GREEN}configuring ~/.gitconfig${C_NONE}
  cp ./.gitconfig ~/.gitconfig
  echo ${C_GREEN}configuring ~/.gitignore_global${C_NONE}
  cp ./.gitignore_global ~/.gitignore_global
  echo ${C_GREEN}configuring ~/.vimrc${C_NONE}
  cp ./.vimrc ~/.vimrc
  echo ${C_GREEN}removing ~/.vim${C_NONE}
  [ -d ~/.vim ] && rm -rf ~/.vim
  echo ${C_GREEN}configuring ~/.vim${C_NONE}
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  cd ~/.vim/bundle
  git clone https://github.com/altercation/vim-colors-solarized.git
  git clone https://github.com/Shougo/neocomplete.vim.git
  git clone https://github.com/tpope/vim-markdown.git
  git clone https://github.com/mattn/webapi-vim.git
  git clone https://github.com/mattn/gist-vim.git
  git clone https://github.com/fatih/vim-go.git
  echo ${C_GREEN}[OK]${C_NONE}
}

main
