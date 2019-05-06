# alias d='docker'
source "$ZSH_DOT/10_utils.zsh"

alias -g H=' --help 2>&1'
alias -g L=' 2>&1 | less -F -R'

# for help less
alias -g HL=' --help 2>&1 L'

# maybe a little nicer than "| less" ??
alias -g B=' 2>&1 | bat'

# END copied stuff

if command -v exa &>/dev/null; then
  alias e='exa --color=auto --group-directories-first'
  alias ls='ls --color=auto --group-directories-first'
fi

alias _='sudo'

alias el="exa -la"
alias l='ls -la'
alias mux="tmuxinator"
alias rgl="rg_into_less"
alias sushi="sudo ssh -F ~/.ssh/config"
alias tmuxdie="tmux kill-session -t 0"

alias rgc='rg --color=always'

alias d='docker'
alias c='docker-compose'

alias g='sr google'
alias goog='googler'

alias an='ansible'
alias ap='ansible-playbook'
alias ang='ansible-galaxy'

alias cat='bat'
# alias for gnucat
alias gcat='cat'

alias svim='vim -u ~/.SpaceVim/vimrc'

alias -g T='$(terraform state list | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'

alias tf='terraform'
alias tf.a='tf apply'
alias tf.p='tf plan'
alias tf.sl='tf state list'
alias tf.ss='tf state show'
alias tf.sp='tf state pull'
alias tf.wl='tf workspace list'
alias tf.ws='tf workspace select'

alias -g BR='$(git branch --all --sort creatordate | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'

alias j='z'

alias -g CP='| tr -d "\n" | xclip -sel clipboard'
alias -g G='| rg'
