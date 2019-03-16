# export ZSH_TMUX_AUTOSTART="true"
# export ZSH_TMUX_FIXTERM="true"
# export COMPOSE_HTTP_TIMEOUT="10000"

export ZSH_DOT="$HOME/.zsh"

source "$ZSH_DOT/30_aliases.zsh"

export PATH="/home/mors/.local/bin/pipenv:$PATH"
export HIHOME="/media/hi/home"
export BIGDRIVE="$HIHOME/bigdrive"

unset ZPLUG_CACHE_FILE

#typeset -gx -U path
#path=( \
    #~/bin(N-/) \
    #~/.zplug/bin(N-/) \
    #~/.tmux/bin(N-/) \
    #"$path[@]" \
    #)
##
## # NOTE: set fpath before compinit
#typeset -gx -U fpath
#fpath=( \
    #~/.zsh/completion(N-/) \
    #~/.zsh/functions(N-/) \
    #~/.zsh/plugins/zsh-completions(N-/) \
    #/usr/local/share/zsh/site-functions(N-/) \
    #$fpath \
#)
#
# # autoload
autoload -Uz run-help
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz is-at-least

export EDITOR=vim
export PAGER=less
export LESS="-isRM"

export ANDROID_HOME="/usr/lib/android-sdk"
export ANDROID_SDK_ROOT="/usr/lib/android-sdk"
export VAGRANT_HOME="$BIGDRIVE/.vagrant.d"

if [[ -z "$XDG_DATA_HOME" ]]; then
  export XDG_DATA_HOME="$HOME/.local/share"
  [[ -e "$XDG_DATA_HOME" ]] ||  mkdir -p "$XDG_DATA_HOME"
fi


################################################################################
# RUBY STUFF
################################################################################

export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"


# The yarn stuff is a little weird because it messes up sometimes.
# More info here:
# https://github.com/yarnpkg/yarn/issues/648
export PATH="$HOME/.cargo/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH:$HOME/bin"

if command -v go 1>/dev/null 2>&1; then
  export GOPATH="$HOME/go"
  export PATH="$PATH:$(go env GOPATH)/bin"
fi


################################################################################
# PYTHON STUFF
################################################################################

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
else
  echo you can install pyenv with
  echo git clone git@github.com:pyenv/pyenv.git ~/.pyenv
fi


################################################################################
# PHP STUFF
################################################################################

export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# export COMPOSE_API_VERSION=1.25

# [ -s ~/.luaver/luaver ] && . ~/.luaver/luaver

export JAVA_OPTS="$JAVA_OPTS"' -XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'

# export AWS_PROFILE="shed"
