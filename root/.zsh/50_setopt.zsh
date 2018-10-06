# Do not print the directory stack after pushd or popd.
setopt pushd_silent
# Replace 'cd -' with 'cd +'
setopt pushd_minus

# Ignore duplicates to add to pushd
setopt pushd_ignore_dups

# pushd no arg == pushd $HOME
setopt pushd_to_home

# Check spell command
setopt correct

# Check spell all
# setopt correct_all

# Prohibit overwrite by redirection(> & >>) (Use >! and >>! to bypass.)
# setopt no_clobber

# Deploy {a-c} -> a b c
setopt brace_ccl

# Enable 8bit
setopt print_eight_bit

# sh_word_split
setopt sh_word_split

# Change
#~$ echo 'hoge' \' 'fuga'
# to
#~$ echo 'hoge '' fuga'
setopt rc_quotes

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
setopt print_exit_value

# Show expaning and executing in what way
#setopt xtrace

# Confirm when executing 'rm *'
# setopt rm_star_wait
setopt rm_star_silent

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
setopt auto_cd
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt auto_pushd
setopt complete_in_word
setopt globdots
setopt interactive_comments
setopt list_types
setopt magic_equal_subst

# zplug acts crazy without this sometimes
setopt monitor

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
