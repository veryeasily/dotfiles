# bindkey -d

# Return if zsh is called from Vim

if [[ "$TERM" = "xterm" ]]; then TERM="xterm-256color" fi

# if [[ -n $VIMRUNTIME ]]; then
#     return 0
# fi
alias tmux='TERM=xterm-256color tmux'

[ -s "$LUKE_BUILD/z/z.sh" ] && . "$LUKE_BUILD/z/z.sh"

for file in $(ls ~/.zsh/*.zsh | grep -v main.zsh); do
  source $file
done

if [[ -f ~/.zplug/init.zsh ]]; then
    export ZPLUG_LOADFILE=~/.zsh/main.zsh
    source ~/.zplug/init.zsh

    # Install plugins if there are plugins that have not been installed
    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    # Then, source plugins and add commands to $PATH
    zplug load
fi

# # Get into tmux if we aren't already
# [ -z ${TMUX+x}  ] && {exec tmux new-session && exit $?;}

# # See
# # https://unix.stackexchange.com/questions/1045/getting-256-colors-to-work-in-tmux
[[ -e ~/.dircolors ]] && eval "$(dircolors "$HOME/.dircolors")"

if [[ -f ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

#PROMPT=" [%j]$PROMPT"

export GOPATH=$HOME/go

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.fzf/shell/completion.zsh
source ~/.fzf/shell/key-bindings.zsh

# Have to overwrite to make it use fd
_fzf_compgen_path() {
  echo "$1"
  command fd --hidden --type file --no-ignore-vcs 2> /dev/null | sed 's@^\./@@'
}
# export FZF_COMPLETION_TRIGGER=''
# bindkey '^T' fzf-completion
# bindkey '^I' $fzf_default_completion
bindkey '^Sc' fzf-cd-widget

# [ -s ~/.luaver/luaver ] && . ~/.luaver/luaver

# see https://github.com/sindresorhus/pure/wiki#show-number-of-jobs-in-prompt
# PROMPT='%(1j.[%j] .)%(?.%F{magenta}.%F{red})${PURE_PROMPT_SYMBOL:-❯}%f '
