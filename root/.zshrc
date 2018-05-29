# bindkey -d

# Return if zsh is called from Vim

if [[ "$TERM" = "xterm" ]]; then TERM="xterm-256color" fi

# if [[ -n $VIMRUNTIME ]]; then
#     return 0
# fi
alias tmux='TERM=xterm-256color tmux'

# # See
# # https://unix.stackexchange.com/questions/1045/getting-256-colors-to-work-in-tmux
[[ -e ~/.dircolors ]] && eval "$(dircolors ~/.dircolors)"

# Get into tmux if we aren't already
[ -z ${TMUX+x}  ] && {exec tmux new-session && exit $?;}

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zshcompdump

# tmux_automatically_attach attachs tmux session
# automatically when your are in zsh
if [[ -x ~/bin/tmuxx ]]; then
    ~/bin/tmuxx
fi

if [[ -f ~/.zplug/init.zsh ]]; then
    export ZPLUG_LOADFILE=~/.zsh/main.zsh
    source ~/.zplug/init.zsh

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
        echo
    fi
    zplug load
fi

if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

export GOPATH=$HOME/go

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bindkey -M viins "^j" "tmux select-pane -D"
# bindkey -M viins "^k" "tmux select-pane -U"
# bindkey -M viins "^h" "tmux select-pane -L"
# bindkey -M viins "^l" "tmux select-pane -R"

source ~/.fzf/shell/completion.zsh
source ~/.fzf/shell/key-bindings.zsh

export FZF_DEFAULT_COMMAND='fd --hidden --type file --no-ignore-vcs'

# Have to overwrite to make it use fd
_fzf_compgen_path() {
  echo "$1"
  command fd --hidden --type file --no-ignore-vcs 2> /dev/null | sed 's@^\./@@'
}
# export FZF_COMPLETION_TRIGGER=''
# bindkey '^T' fzf-completion
# bindkey '^I' $fzf_default_completion
