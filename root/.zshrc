# # See
# # https://unix.stackexchange.com/questions/1045/getting-256-colors-to-work-in-tmux
alias tmux='TERM=xterm-256color tmux'

# Get into tmux if we aren't already
[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}

# Start actual zshrc here
source ~/.fresh/build/shell.sh

export EDITOR=vim

eval $(dircolors ~/.dircolors)

export DISABLE_LS_COLORS="true"

export ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="gianu"

plugins=(git ruby jump tmuxinator nvm rg zsh-navigation-tools vi-mode)

source $ZSH/oh-my-zsh.sh
source "$HOME"/.zshrc.tmux

alias prettyjson='python -m json.tool'

alias j='jump'

export KEYTIMEOUT=20
bindkey -v # Set vi command mode
bindkey "jk" vi-cmd-mode
bindkey -M vicmd v edit-command-line

# [[ -e $(alias run-help)  ]] && unalias run-help
# autoload run-help

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

# Borrowed from
# [here](https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2)
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='fd --type f'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias tmuxdie="tmux kill-session -t 0"
alias mux="tmuxinator"
