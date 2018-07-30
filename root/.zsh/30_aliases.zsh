alias d='docker'
alias dc='docker-compose'
alias g='git'

# BEGIN copied stuff

alias p="print -l"

# For mac, aliases
if is_osx; then
    has "qlmanage" && alias ql='qlmanage -p "$@" >&/dev/null'
    alias gvim="open -a MacVim"
fi

if has 'git'; then
    alias gst='git status'
fi

if has 'richpager'; then
    alias cl='richpager'
fi

# if (( $+commands[gls] )); then
#     alias ls='gls -F --color --group-directories-first'
# elif (( $+commands[ls] )); then
#     if is_osx; then
#         alias ls='ls -GF'
#     else
#     alias ls='ls -F --color'
#     fi
# fi

# Common aliases
alias ..='cd ..'
alias ld='ls -ld'          # Show info about the directory
alias lla='ls -lAF'        # Show hidden all files
alias ll='ls -lF'          # Show long file information
alias la='ls -AF'          # Show hidden files
alias lx='ls -lXB'         # Sort by extension
alias lk='ls -lSr'         # Sort by size, biggest last
alias lc='ls -ltcr'        # Sort by and show change time, most recent last
alias lu='ls -ltur'        # Sort by and show access time, most recent last
alias lt='ls -ltr'         # Sort by date, most recent last
alias lr='ls -lR'          # Recursive ls

# The ubiquitous 'll': directories first, with alphanumeric sorting:
#alias ll='ls -lv --group-directories-first'

alias mv="${ZSH_VERSION:+nocorrect} mv -i"
alias mkdir="${ZSH_VERSION:+nocorrect} mkdir"

autoload -Uz zmv
alias zmv='noglob zmv -W'

alias du='du -h'
alias job='jobs -l'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Use if colordiff exists
if has 'colordiff'; then
    alias diff='colordiff -u'
else
    alias diff='diff -u'
fi

alias vi="vim"

# Use plain vim.
alias nvim='vim -N -u NONE -i NONE'

# The first word of each simple command, if unquoted, is checked to see 
# if it has an alias. [...] If the last character of the alias value is 
# a space or tab character, then the next command word following the 
# alias is also checked for alias expansion
# alias sudo='sudo '
# if is_osx; then
#     alias sudo="${ZSH_VERSION:+nocorrect} sudo "
# fi

# Global aliases
alias -g G='| grep'
alias -g GG='| multi_grep'
alias -g W='| wc'
alias -g X='| xargs'
alias -g F='| "$(available $INTERACTIVE_FILTER)"'
alias -g S="| sort"
alias -g V="| tovim"
alias -g N=" >/dev/null 2>&1"
alias -g N1=" >/dev/null"
alias -g N2=" 2>/dev/null"
alias -g VI='| xargs -o vim'

if has "jq"; then
    alias -g JQ='| jq -C .'
    alias -g JL='| jq -C . | less -R -X'
fi

# function kchange() {
#     kubectx $(kubectx | fzy)
# }

alias -g P='$(kubectl get pods | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g F='$(fzf-tmux --reverse --multi --cycle)'
alias -g J='| jq -C . | less -F'

function filetime() {
    zmodload "zsh/stat"
    zmodload "zsh/datetime"
    strftime "%F %T" "$(stat +mtime "${1:?}")"
}

function _gcloud_change_project() {
    local proj=$(gcloud projects list | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk '{print $1}')
    if [[ -n $proj ]]; then
        gcloud config set project $proj
        return $?
    fi
}
alias gcp=_gcloud_change_project

function devpath() {
    local loc="$(ghq list | fzf-tmux --reverse --multi --cycle --preview="ls -lF $(ghq root)/{}" --preview-window=right:60%)"
    if [[ -n $loc ]]; then
        echo $(ghq root)/$loc
    fi
    return 1
}

# for help less
alias -g HL=' 2>&1 | less'

# END copied stuff

alias e='exa'
alias _='sudo'

alias tmuxdie="tmux kill-session -t 0"
alias mux="tmuxinator"
alias el="exa -la"
alias rgl="rg_into_less"

alias sushi="sudo ssh -F ~/.ssh/config"

alias j='jump'

alias ls='exa --group-directories-first'
alias l='ls -la'
