ZSH=$HOME/.oh-my-zsh

export HELPDIR="/usr/share/zsh/help"

ZSH_THEME="whitney"

plugins=(rails git ruby jump docker docker-compose git-extras yarn aws)

source $ZSH/oh-my-zsh.sh

bindkey -v
# export KEYTIMEOUT=1
bindkey -M viins 'jk' vi-cmd-mode

alias prettyjson='python -m json.tool'
# alias man='vimman'

alias doco='docker-compose'
alias dcr='docker-compose run --rm'
alias dcrst='docker-compose restart'
alias dce='docker-compose exec'
alias dck='docker-compose kill'
alias copy='xclip -sel clip'

[[ -e $(alias run-help)  ]] && unalias run-help
autoload run-help

source $HOME/.zshenv-mobile

source $HOME/.w-helpers

export EDITOR=vim

export NVM_DIR="/home/moresilenter/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# alias dcms='docker-compose \
#   -f /home/moresilenter/code/whitney-cms/docker-compose.yml \
#   -f /home/moresilenter/code/whitney-cms/docker-compose.override.yml \
#   -f /home/moresilenter/code/whitney-cms/docker-compose.debugging.override.yml'
# 
# alias dapi='docker-compose \
#   -f /home/moresilenter/code/whitney-services/docker-compose.yml \
#   -f /home/moresilenter/code/whitney-services/docker-compose.override.yml \
#   -f /home/moresilenter/code/whitney-services/docker-compose.debugging.override.yml'

autoload -U compinit && compinit

# Borrowed from [here](https://wiki.gentoo.org/wiki/Zsh/Guide)
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
