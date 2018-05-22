# vim:ft=zsh

ZPLUG_PROTOCOL=ssh

zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "~/.zshrc.d", from:local, use:"<->_*.zsh"

zplug 'dracula/zsh', as:theme
zplug "rupa/z", use:"z.sh"

zplug "stedolan/jq", \
    as:command, \
    from:gh-r, \
    rename-to:jq

zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    use:"*linux_amd64*", \
    rename-to:"fzf", \
    frozen:1

zplug "junegunn/fzf", \
    from:github, \
    use:"shell/*.zsh"

zplug "BurntSushi/ripgrep", \
    from:gh-r, \
    as:command, \
    rename-to:rg, \
    use:"*x86_64-unknown-linux*"

zplug "plugins/jump", \
     from:oh-my-zsh, \
     as:plugin

# zplug "zsh-users/zsh-completions"
# zplug "zsh-users/zsh-history-substring-search", defer:3
# zplug "zsh-users/zsh-syntax-highlighting", defer:2
# zplug "glidenote/hub-zsh-completion"

zplug 'Valodim/zsh-curl-completion'

zplug 'knqyf263/pet', as:command, hook-build:'go get -d && go build'

# zplug "philovivero/distribution", \
#     as:command, \
#     use:distribution, \
#     if:'(( $+commands[perl] ))'

# zplug "wg/wrk", \
#     as:command, \
#     hook-build:"make"

# zplug "reorx/httpstat", \
#     as:command, \
#     use:'(httpstat).py', \
#     rename-to:'$1', \
#     if:'(( $+commands[python] ))'

# zplug "jhawthorn/fzy", \
#     as:command, \
#     hook-build:"make && sudo make install"


ZSH_AUTOSUGGEST_USE_ASYNC=true
# 
zplug "zsh-users/zsh-autosuggestions"
zplug "plugins/jump", from:oh-my-zsh, as:plugin
