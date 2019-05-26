export PATH="$HOME/bin:$PATH"
export PATH="/media/hi/home/bigdrive/bin:$PATH"

if [[ -z "$XDG_DATA_HOME" ]]; then
  export XDG_DATA_HOME="$HOME/.local/share"
  [[ -e "$XDG_DATA_HOME" ]] ||  mkdir -p "$XDG_DATA_HOME"
fi

export EDITOR=vim
export PAGER=less
export LESS="-isRM"
export HIHOME="/media/hi/home"
export BIGDRIVE="$HIHOME/bigdrive"
export ANDROID_HOME="/media/hi/home/bigdrive/.local/lib/android-sdk"
export ANDROID_SDK_ROOT="/media/hi/home/bigdrive/.local/lib/android-sdk"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export VAGRANT_HOME="$BIGDRIVE/.vagrant.d"

autoload -Uz run-help
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz is-at-least

################################################################################
# RUBY STUFF
################################################################################

export RBENV_ROOT="$HOME/.rbenv"
eval "$(rbenv init -)"

# The yarn stuff is a little weird because it messes up sometimes.
# More info here:
# https://github.com/yarnpkg/yarn/issues/648
export PATH="$HOME/.cargo/bin:$PATH:$HOME/bin"

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
fi

################################################################################
# PHP STUFF
################################################################################

export PATH="$PATH:$HOME/.config/composer/vendor/bin"
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

# export JAVA_OPTS="$JAVA_OPTS"' -XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'

export PATH="/home/mors/.ebcli-virtual-env/executables:$PATH"
export PATH="/home/mors/.deno/bin:$PATH"

[[ -s "/home/mors/.gvm/scripts/gvm" ]] && source "/home/mors/.gvm/scripts/gvm"

eval "$(direnv hook zsh)"

# I dont trust fnm enough to put it in my zshenv
export PATH=$HOME/.fnm:$PATH
eval "$(fnm env --multi --use-on-cd)"
