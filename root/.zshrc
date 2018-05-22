umask 022

# Return if zsh is called from Vim
if [[ -n $VIMRUNTIME ]]; then
  return 0
fi

echo ''
echo ''
echo '       .^. .  _              '
echo '      /: ||`\/ \~  ,         '
echo '    , [   &    / \ y\'"'"'       '
echo '   {v'"'"':   `\   / `&~-,       '
echo '  '"'"'y. '"'"'    |`   .  '"'"' /       '
echo '   \   '"'"'  .       , y        '
echo '   v .        '"'"'     v        '
echo '   V  .~.      .~.  V        '
echo '   : (  0)    (  0) :        '
echo '    i `'"'"'`      `'"'"'` j         '
echo '     i     __    ,j          '
echo '      `%`~....~'"'"'&            '
echo '   <~o'"'"' /  \/` \-s,          '
echo '    o.~'"'"'.  )(  r  .o ,.      '
echo '   o'"'"',  %``\/``& : '"'"'bF       '
echo '  d'"'"', ,ri.~~-~.ri , +h       '
echo '  `oso'"'"' d`~..~`b '"'"'sos`       '
echo '       d`+ II +`b            '
echo '       i_:_yi_;_y            '
echo ''
echo '~~~ New shell started!! ~~~'
echo ''


if [[ -f ~/.zplug/init.zsh ]]; then
    export ZPLUG_LOADFILE=~/.zshrc.d/main.zsh
    source ~/.zplug/init.zsh

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
        echo
    fi
    zplug load
fi

echo ''
echo ''
echo ''
echo ''
echo ''
echo ''
echo '          _____                    _____          ';
echo '         /\    \                  /\    \         ';
echo '        /::\    \                /::\____\        ';
echo '       /::::\    \              /:::/    /        ';
echo '      /::::::\    \            /:::/    /         ';
echo '     /:::/\:::\    \          /:::/    /          ';
echo '    /:::/  \:::\    \        /:::/    /           ';
echo '   /:::/    \:::\    \      /:::/    /            ';
echo '  /:::/    / \:::\    \    /:::/    /             ';
echo ' /:::/    /   \:::\ ___\  /:::/    /              ';
echo '/:::/____/  ___\:::|    |/:::/____/               ';
echo '\:::\    \ /\  /:::|____|\:::\    \               ';
echo ' \:::\    /::\ \::/    /  \:::\    \              ';
echo '  \:::\   \:::\ \/____/    \:::\    \             ';
echo '   \:::\   \:::\____\       \:::\    \            ';
echo '    \:::\  /:::/    /        \:::\    \           ';
echo '     \:::\/:::/    /          \:::\    \          ';
echo '      \::::::/    /            \:::\    \         ';
echo '       \::::/    /              \:::\____\        ';
echo '        \::/____/                \::/    /        ';
echo '                                  \/____/         ';
echo '                                                  ';
echo '          _____                    _____          ';
echo '         /\    \                  /\    \         ';
echo '        /::\____\                /::\    \        ';
echo '       /:::/    /               /::::\    \       ';
echo '      /:::/    /               /::::::\    \      ';
echo '     /:::/    /               /:::/\:::\    \     ';
echo '    /:::/____/               /:::/__\:::\    \    ';
echo '   /::::\    \              /::::\   \:::\    \   ';
echo '  /::::::\    \   _____    /::::::\   \:::\    \  ';
echo ' /:::/\:::\    \ /\    \  /:::/\:::\   \:::\    \ ';
echo '/:::/  \:::\    /::\____\/:::/  \:::\   \:::\____\';
echo '\::/    \:::\  /:::/    /\::/    \:::\   \::/    /';
echo ' \/____/ \:::\/:::/    /  \/____/ \:::\   \/____/ ';
echo '          \::::::/    /            \:::\    \     ';
echo '           \::::/    /              \:::\____\    ';
echo '           /:::/    /                \::/    /    ';
echo '          /:::/    /                  \/____/     ';
echo '         /:::/    /                               ';
echo '        /:::/    /                                ';
echo '        \::/    /                                 ';
echo '         \/____/                                  ';
echo '                                                  ';
echo ''
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
echo ''

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
