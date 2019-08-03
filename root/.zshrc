# Set ZSH_PROFILE to debug startup times
[[ $ZSH_PROFILE ]] && zmodload zsh/zprof

if [[ -n $VIMRUNTIME ]] && ! [[ -n $VIM_TERMINAL ]]; then
    return 0
fi

# Environment variables (oh-my-zsh and my own stuff)
ZSH="$HOME/.oh-my-zsh"
ZSH_DIR="${ZSH_DIR:-$HOME/.zsh}"
ZSH_CUSTOM="$ZSH_DIR/oh-my-zsh-custom"
BAT_THEME='TwoDark'
ZSH_THEME='spaceship'

function lju::source_if_exists() {
    [[ -e "$1" ]] && source "$1"
}

[[ -e "$ZSH_DIR/config/spaceship.zsh" ]] && source "$ZSH_DIR/config/spaceship.zsh"
[[ -e "$ZSH_DIR/config/oh_my_zsh.zsh" ]] && source "$ZSH_DIR/config/oh_my_zsh.zsh"

# Add custom completion functions
if [[ -e "$ZSH_DIR/fpath" ]]; then
  FPATH="$ZSH_DIR/fpath:$FPATH"
fi

# From: https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

[[ -e "$ZSH/oh-my-zsh.sh" ]] && source $ZSH/oh-my-zsh.sh
[[ -e "$ZSH_DIR/main.zsh" ]] && source "$ZSH_DIR/main.zsh"
[[ -e "$ZSH_DIR/zshrc.local.zsh" ]] && source "$ZSH_DIR/zshrc.local.zsh"

[[ $ZSH_PROFILE ]] && zprof

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
