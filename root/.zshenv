# if [[ -z "$XDG_DATA_HOME" ]]; then
#   export XDG_DATA_HOME="$HOME/.local/share"
#   [[ -e "$XDG_DATA_HOME" ]] ||  mkdir -p "$XDG_DATA_HOME"
# fi
# 
export EDITOR=vim
export PAGER=less
export LESS="-isRM"
# export ANDROID_HOME="/media/hi/home/bigdrive/.local/lib/android-sdk"
# export ANDROID_SDK_ROOT="/media/hi/home/bigdrive/.local/lib/android-sdk"
# export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"

autoload -Uz run-help
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz is-at-least

################################################################################
# RUBY STUFF
################################################################################

export RBENV_ROOT="$HOME/.rbenv"
eval "$(rbenv init -)"

export PATH="$HOME/.cargo/bin:$PATH"

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

# export NVM_DIR="$HOME/.nvm"
# source "$(/usr/local/bin/brew --prefix nvm)/nvm.sh"

export PATH="$HOME/.config/composer/vendor/bin:$PATH"
[[ -e "$HOME/.phpbrew/bashrc" ]] && source "$HOME/.phpbrew/bashrc"

# export JAVA_OPTS="$JAVA_OPTS"' -XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'

export PATH="$HOME/.ebcli-virtual-env/executables:$PATH"
export PATH="$HOME/.deno/bin:$PATH"

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
