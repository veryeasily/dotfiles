has() {
    type "${1:?too few arguments}" &>/dev/null
}

# reload resets Completion function
reload() {
    local f
    f=(~/.zsh/Completion/*(.))
    unfunction $f:t 2>/dev/null
    autoload -U $f:t
}

# is_login_shell returns true if current shell is first shell
is_login_shell() {
    [[ $SHLVL == 1 ]]
}

# is_git_repo returns true if cwd is in git repository
is_git_repo() {
    git rev-parse --is-inside-work-tree &>/dev/null
    return $status
}

# is_screen_running returns true if GNU screen is running
is_screen_running() {
    [[ -n $STY ]]
}

# is_tmux_runnning returns true if tmux is running
is_tmux_runnning() {
    [[ -n $TMUX ]]
}

# is_screen_or_tmux_running returns true if GNU screen or tmux is running
is_screen_or_tmux_running() {
    is_screen_running || is_tmux_runnning
}

# shell_has_started_interactively returns true if the current shell is
# running from command line
shell_has_started_interactively() {
    [[ -n $PS1 ]]
}

# is_ssh_running returns true if the ssh deamon is available
is_ssh_running() {
    [[ -n $SSH_CLIENT ]]
}

# ostype returns the lowercase OS name
ostype() {
    echo ${(L):-$(uname)}
}

# os_detect export the PLATFORM variable as you see fit
os_detect() {
    export PLATFORM
    case "$(ostype)" in
        *'linux'*)  PLATFORM='linux'   ;;
        *'darwin'*) PLATFORM='osx'     ;;
        *'bsd'*)    PLATFORM='bsd'     ;;
        *)          PLATFORM='unknown' ;;
    esac
}

# is_osx returns true if running OS is Macintosh
is_osx() {
    os_detect
    if [[ $PLATFORM == "osx" ]]; then
        return 0
    else
        return 1
    fi
}
alias is_mac=is_osx

# is_linux returns true if running OS is GNU/Linux
is_linux() {
    os_detect
    if [[ $PLATFORM == "linux" ]]; then
        return 0
    else
        return 1
    fi
}

# is_bsd returns true if running OS is FreeBSD
is_bsd() {
    os_detect
    if [[ $PLATFORM == "bsd" ]]; then
        return 0
    else
        return 1
    fi
}

# get_os returns OS name of the platform that is running
get_os() {
    local os
    for os in osx linux bsd; do
        if is_$os; then
            echo $os
        fi
    done
}

# # Add emacs-like keybind to viins mode
bindkey -M viins '^F'  forward-char
bindkey -M viins '^B'  backward-char
bindkey -M viins '^P'  up-line-or-history
bindkey -M viins '^N'  down-line-or-history
bindkey -M viins '^A'  beginning-of-line
bindkey -M viins '^E'  end-of-line
bindkey -M viins '^S'  kill-line
bindkey -M viins '^R'  history-incremental-pattern-search-backward
# # bindkey -M viins '\er' history-incremental-pattern-search-forward
bindkey -M viins '^Y'  yank
bindkey -M viins '^W'  backward-kill-word
bindkey -M viins '^U'  backward-kill-line
bindkey -M viins '^H'  backward-delete-char
bindkey -M viins '^?'  backward-delete-char
bindkey -M viins '^G'  send-break
bindkey -M viins '^D'  delete-char-or-list
#bindkey -M menuselect '^k' accept-and-infer-next-history

# Menu select
zmodload -i zsh/complist
bindkey -M menuselect '^[^h' vi-backward-char
bindkey -M menuselect '^[^j' vi-down-line-or-history
bindkey -M menuselect '^[^k' vi-up-line-or-history
bindkey -M menuselect '^[^l' vi-forward-char
bindkey -M menuselect '^[^i' complete-word
bindkey -M vicmd v edit-command-line

bindkey 'jk' vi-cmd-mode
bindkey '^sl' clear-screen
bindkey -s '^se' 'e -a^M'
bindkey '^s;' execute-named-cmd

# From
# https://github.com/knqyf263/pet/tree/e2b42ac4c7067ae474d54a16054b840848c11d85#bashzsh
function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^ss' pet-select

bindkey -r '^L'
if command -v exa &>/dev/null; then
  alias ls='exa --color=auto --group-directories-first'
fi

alias _='sudo'

alias l='exa -la'
alias mux="tmuxinator"
alias rgl="rg_into_less"
alias sushi="sudo ssh -F ~/.ssh/config"

alias d='docker'
alias c='docker-compose'

alias g='sr google'
alias goog='googler'

alias cat='bat'
alias gcat='cat' # alias for gnucat

alias svim='vim -u ~/.SpaceVim/vimrc'

alias tf='terraform'
alias tf.a='tf apply'
alias tf.p='tf plan'
alias tf.sl='tf state list'
alias tf.ss='tf state show'
alias tf.sp='tf state pull'
alias tf.wl='tf workspace list'
alias tf.ws='tf workspace select'

alias he='heroku'

alias -g B=' 2>&1 | bat' # maybe a little nicer than "| less" ??
alias -g BR='$(git branch --all --sort creatordate | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
alias -g CP='| tr -d "\n" | xclip -sel clipboard'
alias -g G='| rg'
alias -g H=' --help 2>&1'
alias -g HL=' --help 2>&1 L' # for help less
alias -g L=' 2>&1 | less -F -R'
alias -g T='$(terraform state list | fzf-tmux --header-lines=1 --reverse --multi --cycle | awk "{print \$1}")'
#!/bin/zsh
function datebak {
  date -Is | tr : _
}

function bak {
  [ -z "$1" ] && echo "bak requires a file argument to backup" && return 1

  readonly local new_name="$1.$(datebak).bak"

  echo "Creating backup $new_name"
  cp $1 $new_name
}

function less_esc {
  env LESS="-CQix4" less "$@"
}

# From
# https://github.com/knqyf263/pet/tree/e2b42ac4c7067ae474d54a16054b840848c11d85#bashzsh
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new -t `printf %q "$PREV"`"
}

# From https://gist.github.com/maxcnunes/7b5eae9cb884f126a70f
function crm() {
	docker-compose stop $1
	docker-compose rm --force $1
}

function aws_prompt_info() {
  printf "${AWS_PROFILE+(aws="$AWS_PROFILE") }"
}


function shed_mode() {
  export AWS_PROFILE=shed
}

function revolvy_mode() {
  export AWS_PROFILE=revolvy
}

function me_mode() {
  export AWS_PROFILE=veryveryeasily
}
setopt monitor # zplug acts crazy without this sometimes
setopt pushd_ignore_dups # Ignore duplicates to add to pushd
setopt pushd_to_home # pushd no arg == pushd $HOME
setopt correct # Check spell command
setopt brace_ccl # Deploy {a-c} -> a b c
setopt print_eight_bit # Enable 8bit
setopt sh_word_split # sh_word_split

# Case of multi redirection and pipe,
# use 'tee' and 'cat', if needed
# ~$ < file1  # cat
# ~$ < file1 < file2        # cat 2 files
# ~$ < file1 > file3        # copy file1 to file3
# ~$ < file1 > file3 | cat  # copy and put to stdout
# ~$ cat file1 > file3 > /dev/stdin  # tee
setopt multios

# Automatically delete slash complemented by supplemented by inserting a space.
setopt auto_remove_slash

# No Beep
setopt no_beep
setopt no_list_beep
setopt no_hist_beep

# Expand '=command' as path of command
# e.g.) '=ls' -> '/bin/ls'
setopt equals

# Do not use Ctrl-s/Ctrl-q as flow control
setopt no_flow_control

# Look for a sub-directory in $PATH when the slash is included in the command
setopt path_dirs

# Show exit status if it's except zero.
setopt no_print_exit_value

# Let me know immediately when terminating job
setopt notify

# Show process ID
setopt long_list_jobs

# Resume when executing the same name command as suspended process name
setopt auto_resume

# Disable Ctrl-d (Use 'exit', 'logout')
#setopt ignore_eof

# Ignore case when glob
setopt no_case_glob

# Use '*, ~, ^' as regular expression
# Match without pattern
#  ex. > rm *~398
#  remove * without a file "398". For test, use "echo *~398"
setopt extended_glob

# If the path is directory, add '/' to path tail when generating path by glob
setopt mark_dirs

# Automaticall escape URL when copy and paste
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# Prevent overwrite prompt from output withour cr
setopt no_prompt_cr

# Let me know mail arrival
setopt mail_warning

setopt hist_save_nodups

# Remove comannd of 'hostory' or 'fc -l' from history list
# setopt hist_no_store

# Remove functions from history list
setopt hist_no_functions

# Append to history file
setopt append_history

setopt always_last_prompt

setopt no_auto_cd
setopt auto_pushd
setopt pushd_silent
setopt pushd_minus
setopt chase_links

setopt no_menu_complete
setopt auto_menu

setopt auto_param_keys
setopt auto_param_slash
setopt complete_in_word
setopt globdots
setopt interactive_comments
setopt list_types
setopt magic_equal_subst

###
# Taken from ./70_misc.zsh
# @elju 3/8/18
setopt bang_hist                 # Treat the '!' character specially during expansion.
setopt extended_history          # Write the history file in the ":start:elapsed;command" format.
setopt inc_append_history        # Write to the history file immediately, not when the shell exits.
setopt share_history             # Share history between all sessions.
setopt hist_expire_dups_first    # Expire duplicate entries first when trimming history.
setopt hist_ignore_dups          # Don't record an entry that was just recorded again.
setopt hist_ignore_all_dups      # Delete old recorded entry if new entry is a duplicate.
setopt hist_find_no_dups         # Do not display a line previously found.
setopt hist_ignore_space         # Don't record an entry starting with a space.
setopt hist_save_no_dups         # Don't write duplicate entries in the history file.
setopt hist_reduce_blanks        # Remove superfluous blanks before recording entry.
setopt hist_verify               # Don't execute immediately upon history expansion.
setopt hist_beep                 # Beep when accessing nonexistent history.

# Important
zstyle ':completion:*:default' menu select=2

# Completing Groping
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'
zstyle ':completion:*' group-name ''

# Completing misc
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
zstyle ':completion:*' use-cache true
zstyle ':completion::complete:*' cache-path "$HOME/.zcache"
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' special-dirs false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# default: --
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'

autoload -Uz cdr
autoload -Uz history-search-end
autoload -Uz modify-current-argument
autoload -Uz smart-insert-last-word
autoload -Uz terminfo
autoload -Uz vcs_info
autoload -Uz zcalc
autoload -Uz zmv
autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz run-help-svk
autoload -Uz run-help-svn

# b4b4r07/emoji-cli
if is_linux; then
    export EMOJI_CLI_FILTER=peco
fi

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# # Emacs style
# zle -N edit-command-line
# bindkey '^xe' edit-command-line
# bindkey '^x^e' edit-command-line
# # Vi style:
zle -N edit-command-line

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=999999999
export SAVEHIST=999999999

[[ -e "$HOME/.dircolors" ]] && eval "$( dircolors -b $HOME/.dircolors )"

# I dont trust fnm enough to put it in my zshenv
export PATH=$HOME/.fnm:$PATH
eval "$(fnm env --multi --use-on-cd)"

eval "$(direnv hook zsh)"

command -v thefuck &>/dev/null && eval $(thefuck --alias)
export LC_COLLATE="C"
#PROMPT=" [%j]$PROMPT"
()
{
    local f
    for f in ./*secret*.zsh(N-.)
    do
        source "$f"
    done
}

################################################################################
# FZF stuff
################################################################################

# jenegunn/fzf
export FZF_DEFAULT_OPTS='
--extended
--ansi
--multi
--bind=ctrl-u:page-up
--bind=ctrl-d:page-down
--bind=ctrl-z:toggle-all
'
if command -v rg &>/dev/null; then
  export FZF_DEFAULT_COMMAND="\
    rg \
      --hidden \
			--no-ignore-vcs \
			--files \
			--ignore-file $HOME/.ignore \
			--ignore-file ./.ignore"
	export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# Have to overwrite to make it use fd
_fzf_compgen_path() {
  echo "$1"
  command fd --hidden --type file --no-ignore-vcs 2> /dev/null | sed 's@^\./@@'
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey '^Sc' fzf-cd-widget

################################################################################
# compinit (generates completion)
################################################################################

autoload -U compinit && compinit
