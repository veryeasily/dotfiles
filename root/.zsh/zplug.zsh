# vim:ft=zsh

ZPLUG_SUDO_PASSWORD="lollol123123"
ZPLUG_PROTOCOL=ssh

zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "~/.zsh", from:local, use:"<->_*.zsh"
zplug 'dracula/zsh', as:theme
zplug "rupa/z", use:"z.sh"
zplug "zsh-users/zsh-completions"
#zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "glidenote/hub-zsh-completion"
zplug 'Valodim/zsh-curl-completion'

zplug "stedolan/jq", \
    as:command, \
    from:gh-r, \
    rename-to:jq

zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    rename-to:"fzf", \
    frozen:1

zplug "BurntSushi/ripgrep", \
    from:gh-r, \
    as:command, \
    rename-to:rg, \
    use:"*windows*"

zplug 'knqyf263/pet', as:command, hook-build:'go get -d && go build'

zplug "philovivero/distribution", \
    as:command, \
    use:distribution, \
    if:'(( $+commands[perl] ))'

zplug "mitmproxy/mitmproxy", \
    as:command, \
    hook-build:"sudo python ./setup.py install"

zplug "wg/wrk", \
    as:command, \
    hook-build:"make"

zplug "reorx/httpstat", \
    as:command, \
    use:'(httpstat).py', \
    rename-to:'$1', \
    if:'(( $+commands[python] ))'

zplug "jhawthorn/fzy", \
    as:command, \
    hook-build:"make && sudo make install"

zplug 'andialbrecht/sqlparse', \
    as:command, \
    hook-build:'python setup.py install'

# zplug "zsh-users/zsh-autosuggestions"

ZSH_AUTOSUGGEST_USE_ASYNC=true

# zplug 'b4b4r07/history', use:misc/zsh/init.zsh
# if zplug check 'b4b4r07/history'; then
#     export ZSH_HISTORY_AUTO_SYNC=false
# fi
