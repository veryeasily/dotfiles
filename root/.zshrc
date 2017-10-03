ZSH=$HOME/.oh-my-zsh

export HELPDIR="/usr/share/zsh/help"

if [[ -z "$TMUX" ]]; then
  echo 'Starting tmux!'
  tmux new A -s cutelilcomputer
fi

source $HOME/.zshenv-mobile

export ZSH_THEME="gianu"

eval $(dircolors ~/.dircolors)

plugins=(git ruby jump docker docker-compose git-extras yarn aws)

source $ZSH/oh-my-zsh.sh

bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M vicmd v edit-command-line

alias prettyjson='python -m json.tool'

# alias rg='rg --max-filesize 15M'

alias doco='docker-compose'
alias dcr='docker-compose run --rm'
alias dcrst='docker-compose restart'
alias dce='docker-compose exec'
alias dck='docker-compose kill'
alias copy='xclip -sel clip'

# # See
# # https://unix.stackexchange.com/questions/1045/getting-256-colors-to-work-in-tmux
# alias tmux='TERM=xterm-256color tmux'

[[ -e $(alias run-help)  ]] && unalias run-help
autoload run-help

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

# Borrowed from
# [here](https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2)
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Borrowed from https://github.com/junegunn/fzf/wiki/Examples#tmux
# Check if we have fuzzy-finder
if hash fzf 2>/dev/null; then
  # Borrowed from https://github.com/junegunn/fzf/wiki/Examples#tmux @elju
  #
  # fs [FUZZY PATTERN] - Select selected tmux session
  #   - Bypass fuzzy finder if there's only one match (--select-1)
  #   - Exit if there's no match (--exit-0)
  fs() {
    local session
    session=$(tmux list-sessions -F "#{session_name}" | \
      fzf --query="$1" --select-1 --exit-0) &&
    tmux switch-client -t "$session"
  }

  # Borrowed from https://github.com/junegunn/fzf/wiki/Examples#tmux @elju
  #
  # ftpane - switch pane (@george-b)
  ftpane() {
    local panes current_window current_pane target target_window target_pane
    panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
    current_pane=$(tmux display-message -p '#I:#P')
    current_window=$(tmux display-message -p '#I')

    target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

    target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
    target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

    if [[ $current_window -eq $target_window ]]; then
      tmux select-pane -t ${target_window}.${target_pane}
    else
      tmux select-pane -t ${target_window}.${target_pane} &&
      tmux select-window -t $target_window
    fi
  }
fi
#
# 
# tmux attach -t cutelilcomputer || tmux new -n cutelilcomputer
