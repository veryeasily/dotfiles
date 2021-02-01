# Set ZSH_PROFILE to debug startup times
[[ $ZSH_PROFILE ]] && zmodload zsh/zprof

if [[ -n $VIMRUNTIME ]] && ! [[ -n $VIM_TERMINAL ]]; then
    return 0
fi

# Environment variables (oh-my-zsh and my own stuff)
ZSH="$HOME/.oh-my-zsh"
ZSH_DIR="$HOME/.zsh"
ZSH_CUSTOM="$ZSH_DIR/omz-custom"
BAT_THEME='TwoDark'
ZSH_THEME='spaceship'

ZSH_DISABLE_COMPFIX=true

function lju::source_if_exists() {
    [[ -e "$1" ]] && source "$1"
}

fpath+=~/.zfunc

[[ -e "$HOME/.zsh/config/spaceship.zsh" ]] && source "$HOME/.zsh/config/spaceship.zsh"
[[ -e "$HOME/.zsh/config/omz.zsh" ]] && source "$HOME/.zsh/config/omz.zsh"

# Add custom completion functions
if [[ -e "$HOME/.zsh/completions" ]]; then
    fpath=("$HOME/.zsh/completions" $fpath)
fi

# From: https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

MY_ZSH_COMPS_LOCATION="$ZSH_CUSTOM/plugins/zsh-completions/src"
if [[ -e "$MY_ZSH_COMPS_LOCATION" ]]; then
    fpath=("$MY_ZSH_COMPS_LOCATION" $fpath)
fi

[[ -e "$ZSH/oh-my-zsh.sh" ]] && source $ZSH/oh-my-zsh.sh
[[ -e "$HOME/.zsh/main.zsh" ]] && source "$HOME/.zsh/main.zsh"
[[ -e "$HOME/.zsh/zshrc.local.zsh" ]] && source "$HOME/.zsh/zshrc.local.zsh"

# Set default TMUX session name

if [[ "$TMUX" ]] && [[ "$(tmux display-message -p "#S")" = 0 ]]; then
    tmux rename-session main
fi

# TODO: I don't know what this is doing here, but my node binaries got really
# messed up when I removed it. (VSCode couldn't find prettier, etc.)

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

if command -v direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
fi

# fnm
if [[ -e "$HOME/.fnm/bin" ]]; then
    export PATH="$HOME/.fnm/bin:$PATH"
    eval "$(fnm env --use-on-cd)"
fi

# Stop the profiler if it's running
[[ $ZSH_PROFILE ]] && zprof
fpath=(~/.zsh.d/ $fpath)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm
export PATH=/Users/hi/.fnm:$PATH
eval "`fnm env`"
