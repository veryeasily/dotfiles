if command -v exa &>/dev/null; then
  alias ls='exa --color=auto --group-directories-first'
fi

alias _='sudo'

alias l='exa -la'
alias mux="tmuxinator"
alias rgl="rg_into_less"
alias sushi="sudo ssh -F ~/.ssh/config"

alias d='docker'
alias c='docker-compose'

alias g='sr google'
alias goog='googler'

alias cat='bat'
alias gcat='cat' # alias for gnucat

alias svim='vim -u ~/.SpaceVim/vimrc'

alias tf='terraform'
alias tf.a='tf apply'
alias tf.p='tf plan'
alias tf.sl='tf state list'
alias tf.ss='tf state show'
alias tf.sp='tf state pull'
alias tf.wl='tf workspace list'
alias tf.ws='tf workspace select'

alias he='heroku'

alias -g B=' 2>&1 | bat' # maybe a little nicer than "| less" ??
alias -g BR='$(git branch --all --sort creatordate | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g CP='| tr -d "\n" | xclip -sel clipboard'
alias -g G='| rg'
alias -g H=' --help 2>&1'
alias -g HL=' --help 2>&1 L' # for help less
alias -g L=' 2>&1 | less -F -R'
alias -g T='$(terraform state list | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
