#PROMPT=" [%j]$PROMPT"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.fzf/shell/completion.zsh
source ~/.fzf/shell/key-bindings.zsh

# Have to overwrite to make it use fd
_fzf_compgen_path() {
  echo "$1"
  command fd --hidden --type file --no-ignore-vcs 2> /dev/null | sed 's@^\./@@'
}
# export FZF_COMPLETION_TRIGGER=''
# bindkey '^T' fzf-completion
# bindkey '^I' $fzf_default_completion
bindkey '^Sc' fzf-cd-widget

# [ -s ~/.luaver/luaver ] && . ~/.luaver/luaver

# see https://github.com/sindresorhus/pure/wiki#show-number-of-jobs-in-prompt
# PROMPT='%(1j.[%j] .)%(?.%F{magenta}.%F{red})${PURE_PROMPT_SYMBOL:-❯}%f '

# command -v awless &>/dev/null && source <(awless completion zsh)
