export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

alias ll="ls -alF"

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

cdpath=( ~ )

HISTFILE="$HOME/.zhistory"
HISTSIZE=1000
SAVEHIST=1000

bindkey -e

autoload -U compinit

setopt auto_cd
setopt auto_pushd

PS1='%{'$'\e[''38;5;153m%}[%n@%m]$%{'$'\e[''00m%}'
RPS1='%{'$'\e[''38;5;153m%}[%d][%T]%{'$'\e[''00m%}'

function pcolor() {
    for ((f = 0; f <= 255; f++)); do
        printf "\e[38;5;%dm %3d#\e[m" $f $f
        if [[ $f%8 -eq 7 ]] then
            printf "\n"
        fi
    done
    echo
}
