# export ZSH_TMUX_AUTOSTART="true"
# export ZSH_TMUX_FIXTERM="true"
# export COMPOSE_HTTP_TIMEOUT="10000"

typeset -gx -U path
path=( \
    ~/bin(N-/) \
    ~/.zplug/bin(N-/) \
    ~/.tmux/bin(N-/) \
    "$path[@]" \
    )
# 
# # NOTE: set fpath before compinit
typeset -gx -U fpath
fpath=( \
    ~/.zsh/completion(N-/) \
    ~/.zsh/functions(N-/) \
    ~/.zsh/plugins/zsh-completions(N-/) \
    /usr/local/share/zsh/site-functions(N-/) \
    $fpath \
)
# 
# # autoload
autoload -Uz run-help
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit && compinit -u
autoload -Uz is-at-least

export EDITOR=vim
export PAGER=less
export LESS="-isRM"

if [[ -z "$XDG_DATA_HOME" ]]; then
  export XDG_DATA_HOME="$HOME/.local/share"
  [[ -e "$XDG_DATA_HOME" ]] ||  mkdir -p "$XDG_DATA_HOME"
fi

export RBENV_ROOT="/usr/local/lib/rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"

# if [[ -z "$VIM" ]]; then
if [[ -e "$NVM_DIR/nvm.sh" ]]; then
  . "$NVM_DIR/nvm.sh"
fi
# else
#   export PATH="$PATH:$NVM_DIR/versions/node/$(cat $NVM_DIR/alias/default)/bin"
# fi

# We add the following incase yarn messed up.
# More info here:
# https://github.com/yarnpkg/yarn/issues/648
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.cargo/bin:${PATH}:/home/mors/bin"
if command -v go 1>/dev/null 2>&1; then
  export GOPATH="$HOME/go"
  export PATH="$PATH:$(go env GOPATH)/bin"
fi
export PYENV_ROOT="/usr/local/lib/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if ! command -v pyenv 1>/dev/null 2>&1; then
  git clone git@github.com:pyenv/pyenv.git ~/.pyenv
fi
eval "$(pyenv init -)"

export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# export COMPOSE_API_VERSION=1.25

# [ -s ~/.luaver/luaver ] && . ~/.luaver/luaver

[[ -e "$HOME/.zshenv.local" ]] && source "$HOME/.zshenv.local"
