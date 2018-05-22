###
# BINDINGS

bindkey "^@" vi-cmd-mode
bindkey -s "^[l" "e -la^M"

# Remove ^Q command so vim can use it
bindkey -r '^Q'

bindkey -M vicmd v edit-command-line

bindkey -M vicmd "/" vi-history-search-backward
bindkey -M vicmd "?" vi-history-search-forward

bindkey "jk" vi-cmd-mode

bindkey -M viins '^F' vi-forward-char
