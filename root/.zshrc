source ~/.fresh/build/shell.sh

export EDITOR=vim

eval $(dircolors ~/.dircolors)

export DISABLE_LS_COLORS="true"

export ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="gianu"

plugins=(git ruby jump tmuxinator nvm)

source $ZSH/oh-my-zsh.sh

alias prettyjson='python -m json.tool'

# export KEYTIMEOUT=1
bindkey -v # Set vi command mode
bindkey "^@" vi-cmd-mode
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M vicmd v edit-command-line

# # See
# # https://unix.stackexchange.com/questions/1045/getting-256-colors-to-work-in-tmux
# alias tmux='TERM=xterm-256color tmux'

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

# autoload -U compinit && compinit

# Borrowed from [here](https://wiki.gentoo.org/wiki/Zsh/Guide)
# zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
# zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Borrowed from
# [here](https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2)
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# We add the following incase yarn messed up.
# More info here:
# https://github.com/yarnpkg/yarn/issues/648
export PATH="$HOME/.yarn/bin:$PATH"

alias tmuxdie="tmux kill-session -t 0"
alias mux="tmuxinator"
