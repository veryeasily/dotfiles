ZSH=$HOME/.oh-my-zsh

export HELPDIR="/usr/share/zsh/help"

ZSH_THEME="onehundred"

plugins=(rails git ruby jump docker docker-compose)

source $ZSH/oh-my-zsh.sh
bindkey -v
bindkey '^j' vi-cmd-mode

alias prettyjson='python -m json.tool'

alias doco='docker-compose'
alias dcr='docker-compose run --rm'
alias dcrst='docker-compose restart'
alias dce='docker-compose exec'
alias dcl='docker-compose logs -f --tail 10'
alias dck='docker-compose kill'

[[ -e $(alias run-help)  ]] && unalias run-help
autoload run-help

source $HOME/.zsh-env

export EDITOR=vim
