set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim

set termguicolors

" let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
" let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'


source ~/.vimrc

" neomake bindings
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning
