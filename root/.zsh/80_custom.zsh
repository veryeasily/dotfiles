docker-rmi() {
    docker images \
        | fzf-tmux --reverse --header-lines=1 --multi --ansi \
        | awk '{print $3}' \
        | xargs docker rmi ${1+"$@"}
}

source <(kubectl completion zsh)
source <(kubectl completion zsh | sed 's/__start_kubectl kubectl/__start_kubectl kube/')
