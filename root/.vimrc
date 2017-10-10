set nocompatible hidden " be iMproved

let g:tern_map_keys=1
let g:tern_map_prefix='<space>'
let g:tern_request_timeout = 2
let g:tern_show_argument_hints="on_hold"

""""""""""""""""""""""""""""""""
" Taken from original ~/.vimrc "
""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'junegunn/fzf', { 'dir': $HOME . '/.fzf', 'do': 'yes \| ./install --all' }
Plug 'junegunn/fzf.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" TPope stuff
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-surround'

" Assorted
Plug 'Chiel92/vim-autoformat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'Kuniwak/vint'
Plug 'mattn/emmet-vim'
Plug 'moll/vim-node'
Plug 'othree/html5.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'

" Colorschemes
Plug 'jacoborus/tender.vim'
Plug 'flazz/vim-colorschemes'

" Initialize plugin system
call plug#end()

" Map leader keys
let mapleader = ","
let maplocalleader = ','

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

let g:ag_working_path_mode='r'

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

set showcmd " Display our current \[count\]
set incsearch

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

filetype plugin indent on
syntax on

" round << and >> to the nearest shiftwidth
set shiftround

" bind gk to grep word under cursor
nnoremap gk :Ag! "\b<C-R><C-W>\b"<CR><CR>
nnoremap gm m

" Leave insert and visual mode more easily
inoremap jk <Esc>`^
inoremap <C-Q> <Esc>`^
noremap <C-Q> <Esc>
vnoremap <C-Q> <Esc>
cnoremap <C-Q> <Esc>

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

" Search command history
nnoremap Q <Esc>q:<C-U>?

" Scroll through searches. See here:
" https://superuser.com/questions/345215/vim-how-do-you-efficiently-search-for-text#comment379095_345216
" nnoremap <C-S-F> q/

" https://robots.thoughtbot.com/faster-grepping-in-vim
" The Silver Searcher
" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor\ --column
set grepformat=%f:%l:%c%m

if &diff
  colorscheme jellyx
else
  colorscheme tender
endif

set noautochdir
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
set timeout timeoutlen=300

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

function! MacroInput(txt)
  call inputsave()
  let text = input('macro prompt: ' . a:txt . '> ')
  call inputrestore()
  return text
endfunction

source ~/.vim.fzf-vim-functions.vim
source ~/.vimrc.highlights.vim

set history=10000

set gdefault

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

"""""""""""""""""""""""""
" END original ~/.vimrc "
"""""""""""""""""""""""""
