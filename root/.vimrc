set nocompatible               " be iMproved
set hidden

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

" Map leader keys
let mapleader = ","
let maplocalleader = ','

let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

let g:CommandTFileScanner = 'git'

let g:EasyClipShareYanks = 1
let g:EasyMotion_leader_key = '<Space>'

let g:user_emmet_mode='inv'
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-p>'

" Macro manager
let g:marvim_find_key = '<leader>m'
let g:marvim_find_key = '<leader>M'

autocmd FileType html,css,javascript.jsx,typescript.tsx EmmetInstall
autocmd FileType html,css,eruby EmmetInstall

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

let g:ag_working_path_mode="r"

let g:tern_map_keys=1
let g:tern_map_prefix='<space>'
let g:tern_request_timeout = 2
let g:tern_show_argument_hints="on_hold"

let g:ycm_complete_in_comments = 1

let g:ctrlp_map = '<leader>t'

" ctlrp root path uses git
let g:ctrlp_working_path_mode = 'ra'

" overcome limit imposed by max height"
let g:ctrlp_match_window = 'results:20'

" ignore big folders
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|__pycache__|data|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

" always have a status line, even on 1 window
set laststatus=2

" Syntastic options
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=Curent:\ %l\ Total:\ %4L
set statusline+=\ \ \ \ \ \ \ \ \ \ %{getcwd()} "this is my hack for whitespace
set statusline+=%=      "left/right separator
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_ruby_checkers = []

fun! SetScssConfig()
    let scssConfig = findfile('.scss-lint.yml', '.;')
    if scssConfig != ''
        let b:syntastic_scss_scss_lint_args = '--config ' . scssConfig
    endif
endf

execute pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

" round << and >> to the nearest shiftwidth
set shiftround

" bind gk to grep word under cursor
nnoremap gk :Ag! "\b<C-R><C-W>\b"<CR><CR>
nnoremap gm m
map <leader>a :Ag
map <leader>A :Ag!

" Leave insert and visual mode more easily
ino jk <esc>
cno jk <c-c>
vno v <esc>

" Window navigation commands
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" Add shortcut for getting cop names
noremap <leader>rc <esc>:RuboCop -D<CR>
noremap <leader>rw jjjj0f:f:Bt:"cy$V/\%Vrubocop:disableE
noremap <leader>rn a # rubocop:disable c
noremap <leader>ra a c

" Toggle paste mode
noremap <leader>vv <esc>:set paste<CR>i
noremap <leader>nn <esc>:set nopaste<CR>

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" https://robots.thoughtbot.com/faster-grepping-in-vim
" The Silver Searcher
" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor\ --column
set grepformat=%f:%l:%c%m

if &diff
  colorscheme jellyx
else
  colorscheme seti
endif

set autochdir
set bs=indent,eol,start

" Sets the ability for comments at the beginning of files to set vim
" properties.
set modeline
set hlsearch
set ruler
set sessionoptions-=options
set smarttab
set tags=./tags;/
set tw=79

set sw=2
set ts=2
set sts=2
set expandtab
set smarttab

" set tab completion in command mode
set wildmode=longest,list,full
set wildmenu

" set's a reasonable timeout
set timeout timeoutlen=500

" set swapfiles to be in the .vim directory
set directory=$HOME/.vim/swapfiles//

" NERDTree config
" see: https://github.com/scrooloose/nerdtree#faq
autocmd VimEnter * if argc() != 0 || exists("s:std_in") | wincmd p | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd FileType      scss           :call SetScssConfig()

hi Search cterm=NONE ctermfg=white ctermbg=black

" Enable autowrapping while editing files
au BufNewFile,BufRead * setlocal formatoptions=crqn

" Ruby
au FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
au FileType ruby,eruby let g:rubycomplete_rails = 1
au FileType ruby,eruby let g:rubycomplete_load_gemfile = 1
au FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
au FileType ruby,eruby setl tw=79 comments=:#\  isfname+=:

" au BufNewFile,BufRead * setlocal formatoptions-=lo
" au FileType ruby,eruby nn <buffer> <F5> :!clear<CR>:!ruby %<CR>
" au FileType ruby,eruby nn <buffer> <F9> :!clear<CR>:!rspec %<CR>

if !exists("*MakeScratch")
  function MakeScratch()
    setlocal bufhidden=hide
    setlocal buftype=nofile
    setlocal noswapfile
  endfunction
endif

if !exists("*SaveMapList")
  function SaveMapList()
    redir @" | silent verbose map | redir END | botright new | put!
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  endfunction
endif

if !exists("*SaveLetList")
  function SaveLetList()
    redir @" | silent verbose let | redir END | botright new | put!
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  endfunction
endif

if !exists(":Mapsbuffer")
  command Mapsbuffer :call SaveMapList()
endif

if !exists(":Letsbuffer")
  command Letsbuffer :call SaveLetList()
endif

" Borrowed from
" [here](https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2)
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" borrowed from https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
set gdefault
