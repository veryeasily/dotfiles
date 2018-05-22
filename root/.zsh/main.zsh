# vim:ft=zsh

ZPLUG_SUDO_PASSWORD="lollol123123"
ZPLUG_PROTOCOL=ssh

zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "~/.zsh", from:local, use:"<->_*.zsh"

zplug 'dracula/zsh', as:theme

zplug "rupa/z", use:"z.sh"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "glidenote/hub-zsh-completion"
zplug 'Valodim/zsh-curl-completion'

zplug "stedolan/jq", \
  as:command, \
  from:gh-r, \
  rename-to:jq

zplug 'sharkdp/fd', \
  from:gh-r, \
  as:command, \
  rename-to:"fd"

zplug "junegunn/fzf-bin", \
  as:command, \
  from:gh-r, \
  rename-to:"fzf", \
  frozen:1

# zplug "junegunn/fzf", \
#   use:"shell/*.zsh"

zplug "junegunn/fzf", \
  as:command, \
  use:bin/fzf-tmux

zplug "BurntSushi/ripgrep", \
  from:gh-r, \
  as:command, \
  rename-to:rg, \
  use:"*x86_64-unknown-linux*"

zplug 'knqyf263/pet', as:command, hook-build:'go get -d && go build'

zplug "philovivero/distribution", \
  as:command, \
  use:distribution, \
  if:'(( $+commands[perl] ))'

zplug "reorx/httpstat", \
  as:command, \
  use:'(httpstat).py', \
  rename-to:'$1', \
  if:'(( $+commands[python] ))'

zplug "jhawthorn/fzy", \
  as:command, \
  hook-build:"make && sudo make install"

# ZSH_AUTOSUGGEST_USE_ASYNC=true
# 
# zplug "zsh-users/zsh-autosuggestions"

# zplug 'b4b4r07/history', use:misc/zsh/init.zsh
# if zplug check 'b4b4r07/history'; then
#     export ZSH_HISTORY_AUTO_SYNC=false
# fi

zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/jump", from:oh-my-zsh

# Make zsh autostart tmux
# export ZSH_TMUX_AUTOSTART=true
# zplug "plugins/tmux",  from:oh-my-zsh, as:plugin

# zplug 'zsh-users/zsh-autosuggestions', as:plugin

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
