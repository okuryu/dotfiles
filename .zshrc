export TERM=xterm-256color
export EDITOR=vim
export PATH=~/.rbenv/bin:/usr/local/bin:$PATH

alias ll="ls -aFl"

bindkey -e

fpath=(~/.zsh/functions/Completion $fpath)

autoload -Uz colors
colors
autoload -Uz compinit
compinit
autoload -Uz git-escape-magic
git-escape-magic
autoload -Uz vcs_info

setopt auto_cd
setopt auto_pushd
setopt transient_rprompt
setopt prompt_subst

zstyle ':completion:*' matcher-list 'm:{A-Za-z}={a-zA-Z}'

HISTFILE="$HOME/.zhistory"
HISTSIZE=1000
SAVEHIST=1000

precmd() {
  vcs_info
}
zstyle ':vcs_info:*' formats '(%r@%b)'
PROMPT='%{$fg[blue]%}[%M]%{$fg[green]%}${vcs_info_msg_0_}%{$fg[blue]%}$%{$reset_color%} '
RPROMPT='%{$fg[blue]%}[%~]%{$reset_color%}'

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
eval "$(rbenv init - zsh)"
