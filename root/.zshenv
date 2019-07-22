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
