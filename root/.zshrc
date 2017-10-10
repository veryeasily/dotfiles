export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export EDITOR=vim

source $HOME/.zshenv-mobile

eval $(dircolors ~/.dircolors)

export ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="gianu"

# source ~/.venv/bin/activate

plugins=(git ruby jump)

# TMUX PLUGIN (taken and modified from ~/.oh-my-zsh/plugins/tmux.plugin.zsh
# Configuration variables
#
# Automatically start tmux
ZSH_TMUX_AUTOSTART=false
# Set term to screen or screen-256color based on current terminal support
ZSH_TMUX_FIXTERM=true
# Set '-CC' option for iTerm2 tmux integration
ZSH_TMUX_ITERM2=false
# The TERM to use for non-256 color terminals.
# Tmux states this should be screen, but you may need to change it on
# systems without the proper terminfo
ZSH_TMUX_FIXTERM_WITHOUT_256COLOR="xterm"
# The TERM to use for 256 color terminals.
# Tmux states this should be screen-256color, but you may need to change it on
# systems without the proper terminfo
ZSH_TMUX_FIXTERM_WITH_256COLOR="xterm-256color"

source $ZSH/oh-my-zsh.sh

alias prettyjson='python -m json.tool'

bindkey -v
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
YARN_BIN=$(yarn global bin)
(echo "$PATH" | grep "$YARN_BIN") || export PATH="$(yarn global bin):$PATH"

alias tmuxdie="tmux kill-session -t 0"
alias mux="tmuxinator"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
