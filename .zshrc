export TERM="xterm-256color"
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"

[[ -d "$HOME/local/bin" ]] && export PATH="$HOME/local/bin:$PATH"

alias ll="ls -aFl"

bindkey -e

autoload -U compinit
compinit

setopt auto_cd
setopt auto_pushd

zstyle ':completion:*' matcher-list 'm:{A-Za-z}={a-zA-Z}'

HISTFILE="$HOME/.zhistory"
HISTSIZE=1000
SAVEHIST=1000

local BLUE=$'%{\e[38;5;153m%}'
local DEFAULT=$'%{\e[00m%}'
PROMPT=$BLUE'[%M][%d]'$'\n''$ '$DEFAULT

function pcolor() {
  for ((f = 0; f <= 255; f++)); do
    printf "\e[38;5;%dm %3d#\e[m" $f $f
    if [[ $f%8 -eq 7 ]] then
      printf "\n"
    fi
  done
  echo
}

[[ -f "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

